import 'package:flutter/material.dart';
import 'package:wymc_dart/color.dart';
import 'package:wymc_dart/images.dart';
import 'package:wymc_dart/textstyle.dart';

class Footer1Section extends StatelessWidget {
  const Footer1Section({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmall = width < 576;
    bool isMedium = width < 768;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: isSmall ? 16.0 : 100.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isSmall
                ? <Widget>[
                    footerImg,
                    getFoot1part1(),
                    getFoot1part2(),
                    getFoot1part3()
                  ]
                : <Widget>[
                    Row(
                      children: <Widget>[
                        Visibility(
                          visible: isMedium,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: footerImg,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Visibility(
                          visible: !isMedium,
                          child: Expanded(
                              child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  alignment: Alignment.centerLeft,
                                  child: footerImg)),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              alignment: Alignment.centerLeft,
                              child: getFoot1part1()),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              alignment: Alignment.centerLeft,
                              child: getFoot1part2()),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              alignment: Alignment.centerLeft,
                              child: getFoot1part3()),
                        ),
                      ],
                    ),
                  ]));
  }

  Widget getFoot1part1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Text(
          'ข้อมูลลงทะเบียนประชาชน',
          style: cTATSanaSuksaBoldTextStyle(cRed, 16.0),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'การรับสิทธิ การใช้งานแอปพลิเคชั่น “เป๋าตัง” และ “ถุงเงิน” \nติดต่อ ชิมช้อปใช้ Call Center by Krungthai โทร.0 2111 1144',
          style: cTATSanaSuksaTextStyle(cBlack, 14.0),
        ),
      ],
    );
  }

  Widget getFoot1part2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Text(
          'ข้อมูลลงทะเบียนผู้ประกอบการ',
          style: cTATSanaSuksaBoldTextStyle(cRed, 16.0),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'เงื่อนไขและวิธีการเข้าร่วมมาตรการฯ \nติดต่อ โทร.0 2270 6400 กด 7',
          style: cTATSanaSuksaTextStyle(cBlack, 14.0),
        ),
      ],
    );
  }

  Widget getFoot1part3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Text(
          'ข้อมูลเที่ยวชิมช้อปใช้',
          style: cTATSanaSuksaBoldTextStyle(cRed, 16.0),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'ติดต่อ ททท. \nโทร1672',
          style: cTATSanaSuksaTextStyle(cBlack, 14.0),
        ),
      ],
    );
  }
}
