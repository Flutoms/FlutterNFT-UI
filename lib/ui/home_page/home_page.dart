import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/ui/widgets/app_bar.dart';
import 'package:flutter_animations/ui/widgets/blured_circle.dart';
import 'package:flutter_animations/ui/widgets/image_list.dart';
import 'package:flutter_animations/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;

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
                                    itemCount: 5,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        ImageItemWidget(index: index)),
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
  const ImageItemWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: darkColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'assets/nfts/${index + 1}.png',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Text(
            'Chromium Ape #SDS$index',
            style: globalTextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
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
