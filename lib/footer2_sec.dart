import 'package:flutter/material.dart';
import 'package:wymc_dart/api.dart';
import 'package:wymc_dart/color.dart';
import 'dart:html' as html;

import 'package:wymc_dart/textstyle.dart';

class Footer2Section extends StatelessWidget {
  const Footer2Section({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmall = width < 576;

    return FutureBuilder(
      future: api.getApi(),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return isSmall
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: isSmall ? 16.0 : 100.0),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getFooter2Topic0(),
                    SizedBox(
                      height: 10,
                    ),
                    getFooter2Topic1(),
                    SizedBox(
                      height: 10,
                    ),
                    getFooter2Topic2(),
                    SizedBox(
                      height: 10,
                    ),
                    getFooter2Topic3()
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(width: width * 0.1),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: getFooter2Topic0()),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: getFooter2Topic1()),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: getFooter2Topic2()),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: getFooter2Topic3()),
                    ),
                    SizedBox(width: width * 0.1),
                  ]);
      },
    );
  }

  Widget getFooter2Topic0() {
    return Text(
      'Copyright © 2003-2019',
      style: cTATSanaChonBoldTextStyle(cWhite, 12.0),
    );
  }

  Widget getFooter2Topic1() {
    return InkWell(
      child: Text(
        api.navItem1Label,
        style: cTATSanaChonBoldTextStyle(cWhite, 12.0),
      ),
      onTap: () {
        html.window.open(api.navItem1href, '_blank');
      },
    );
  }

  Widget getFooter2Topic2() {
    return InkWell(
      child: Text(
        api.navItem2Label,
        style: cTATSanaChonBoldTextStyle(cWhite, 12.0),
      ),
      onTap: () {
        html.window.open(api.navItem2href, '_blank');
      },
    );
  }

  Widget getFooter2Topic3() {
    return InkWell(
      child: Text(
        api.navItem3Label,
        style: cTATSanaChonBoldTextStyle(cWhite, 12.0),
      ),
      onTap: () {
        html.window.open(api.navItem3href, '_blank');
      },
    );
  }
}
