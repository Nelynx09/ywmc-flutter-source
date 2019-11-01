import 'package:flutter/material.dart';
import 'package:wymc_dart/images.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmall = width < 576;
    return Container(
      height: isSmall ? 200 : 400,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/banner-left-s.png'))),
            child: Row(
              children: <Widget>[
                Expanded(child: bannerLeftImg),
                Expanded(child: bannerCenterImg),
                Expanded(child: bannerRightImg)
              ],
            ),
          ),
          Container(
            width: isSmall ? 150 : 250,
            child: bannerLogoImg)
        ],
      ),
    );
  }
}
