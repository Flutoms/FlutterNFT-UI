import 'package:flutter/material.dart';
import 'package:flutter_animations/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: lightColor, shape: BoxShape.circle),
                  child:
                      SvgPicture.asset('assets/svg/eth_logo.svg', height: 23)),
              const SizedBox(width: 10),
              Text('\$ 243.67',
                  style: globalTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const SizedBox(width: 15)
            ],
          ),
        ),
        const Spacer(),
        Container(
            padding: const EdgeInsets.all(10),
            decoration:
                BoxDecoration(color: lightColor, shape: BoxShape.circle),
            child: SvgPicture.asset('assets/svg/notif_bell.svg',
                color: Colors.white, height: 23)),
      ],
    );
  }
}
