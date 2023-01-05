import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/ui/detail_nft_screen.dart';
import 'package:flutter_animations/ui/widgets/app_bar.dart';
import 'package:flutter_animations/ui/widgets/blured_circle.dart';
import 'package:flutter_animations/ui/widgets/image_list.dart';
import 'package:flutter_animations/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  var itemCount = 10;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => size = MediaQuery.of(context).size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: ValueListenableBuilder(
            valueListenable: chipIndex,
            builder: (context, value, child) {
              return Scaffold(
                backgroundColor: const Color(0xff1b1e26),
                body: Stack(
                  children: [
                    Positioned(
                      top: 70,
                      left: 0,
                      child: Container(
                        alignment: Alignment.center,
                        color: const Color(0xFF2D2F41),
                        child: BlurCircleWidget(
                            circleWidth: 30,
                            blurSigma: 50,
                            color: const Color(0xff421f40).withAlpha(190)),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        color: const Color(0xFF2D2F41),
                        child: BlurCircleWidget(
                            circleWidth: 30,
                            blurSigma: 50,
                            color: const Color(0xff1C314A).withAlpha(190)),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const AppBarWidget(),
                          const SizedBox(height: 30),
                          Flexible(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: const [
                                  ChipsWidget(text: 'All', index: 0),
                                  ChipsWidget(text: 'Popular', index: 1),
                                  ChipsWidget(text: 'Art Work', index: 2),
                                  ChipsWidget(text: '3D', index: 3),
                                  ChipsWidget(text: 'Animation', index: 4)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Expanded(
                            flex: 15,
                            child: SingleChildScrollView(
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: itemCount,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        ImageItemWidget(
                                            index: index,
                                            avatarIndex: itemCount - index)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget(
      {Key? key, required this.index, required this.avatarIndex})
      : super(key: key);

  final int index;
  final int avatarIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NFTScreen(image: 'assets/nfts/${index + 1}.png')),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: darkColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Hero(
                  tag: 'assets/nfts/${index + 1}.png',
                  child: Image.asset(
                    'assets/nfts/${index + 1}.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chromium Ape #SDS$index',
                    style: globalTextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Divider(color: lightColor),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Creator',
                              style: globalTextStyle(
                                  color: Colors.white38, fontSize: 12)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/nfts/$avatarIndex.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text('@X${index}2H3bv${index}...',
                                  style: globalTextStyle(
                                      fontSize: 13, color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Current bid',
                              style: globalTextStyle(
                                  color: Colors.white38, fontSize: 12)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/eth_logo.svg',
                                  height: 20),
                              const SizedBox(width: 8),
                              Text('${((index + 1) * 3) - index} ETH',
                                  style: globalTextStyle(
                                      fontSize: 13, color: Colors.white)),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var chipIndex = ValueNotifier(0);

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({Key? key, required this.text, required this.index})
      : super(key: key);

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: chipIndex,
      builder: (context, value, child) => GestureDetector(
        onTap: () => chipIndex.value = index,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: index == value ? blueColor : darkColor,
                borderRadius: BorderRadius.circular(50)),
            child: Text(text,
                style: globalTextStyle(
                    fontSize: 16,
                    color: index == value ? Colors.white : Colors.white60))),
      ),
    );
  }
}
