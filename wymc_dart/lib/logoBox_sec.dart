import 'package:flutter/material.dart';

import 'images.dart';

class LogoBoxSection extends StatelessWidget {
  const LogoBoxSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmall = width < 576;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: isSmall ? 16.0 : 100.0),
      child: isSmall
          ? Column(
              children: getLogoBoxByType('Column'),
            )
          : Row(
              children: getLogoBoxByType('Row'),
            ),
    );
  }

  List<Widget> getLogoBoxByType(String type) {
    List<Widget> list = [];
    for (Widget i in getLogoBox()) {
      list.add(Expanded(
        child: i,
      ));
    }
    return type == 'Row' ? list : getLogoBox();
  }

  List<Widget> getLogoBox() {
    List<Widget> imgBoxs = [
      bannerKTBImg,
      bannerCGDImg,
      bannerTATImg,
    ];
    return imgBoxs;
  }
}
