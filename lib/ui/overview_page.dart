import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/ui/home_page/home_page.dart';

import '../animations/animations.dart';
import '../utils/utils.dart';
import 'widgets/image_list.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
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
        child: Scaffold(
          backgroundColor: const Color(0xff010101),
          body: Stack(
            children: [
              Image.network(
                  "https://images.unsplash.com/photo-"
                  "1590503002569-c09d4ddfd698?ixlib=rb-4.0.3&ixid"
                  "=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&"
                  "auto=format&fit=crop&w=1470&q=80",
                  height: (MediaQuery.of(context).size.height / 2) - 30,
                  fit: BoxFit.cover),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ImageListView(startIndex: 1, duration: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            'Find And Collect Your Rare Digital Art',
                            style: globalTextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 35),
                          ),
                          Text(
                            'Check out this raffle for you guys only! new coin minted show some love.',
                            style: globalTextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 30),
                          FadeAnimation(
                            intervalEnd: 0.1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => HomePage()),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 16),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: blueColor,
                                ),
                                child: Text('Connect Wallet',
                                    style: globalTextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
