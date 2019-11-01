import 'package:flutter/material.dart';
import 'api.dart';
import 'banner.dart';
import 'color.dart';
import 'customAppbar.dart';
import 'footer2_sec.dart';
import 'logoBox_sec.dart';
import 'logoCircle_sec.dart';
import 'textstyle.dart';
import 'footer1_sec.dart';
import 'dart:html' as html;
import 'flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmall = width < 576;

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: api.getApi(),
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Stack(children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  BannerWidget(),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'ตั้งแต่วันที่',
                    style: cTATSanaChonTextStyle(cBlack, 16.0),
                  ),
                  Text(
                    api.duration ?? "",
                    style:
                        cTATSanaChonBoldTextStyle(cRed, isSmall ? 30.0 : 48.0),
                    textAlign: TextAlign.center,
                  ),
                  Transform.translate(
                      offset: Offset(0, 150),
                      child: Divider(
                        thickness: 1,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      elevation: 5,
                      hoverElevation: 5,
                      onPressed: () {
                        html.window.open(api.navItem1href, '_blank');
                      },
                      color: cBlue,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'ลงทะเบียน เฟส 2 \n ตัวแต่วันที่ 24 ต.ค.62 วันละ 2 รอบ เวลา 6.00 และ 18.00 น. \n(จำกัดจำนวนผู้ลงทะเบียนรอบละ 5 แสนคน รวม 1 ล้านคนต่อวัน)',
                          style: cTATSanaChonBoldTextStyle(
                              cWhite, isSmall ? 18 : 24.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      hoverColor: cYellow,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isSmall ? 16.0 : 100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 40.0, bottom: 16.0),
                          child: Text(
                            'มาตราการส่งเสริมการบริโภค${isSmall ? '' : '\n'}ในประเทศ ${isSmall ? '\n' : ''}"ชิมช้อปใช้"',
                            style: cTATSanaChonBoldTextStyle(
                                cRed, isSmall ? 24.0 : 36.0),
                          ),
                        ),
                        Html(
                          data: """${api.detail}""",
                          defaultTextStyle:
                              cTATSanaSuksaTextStyle(cBlack, 18.0),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 8.0),
                          child: Text(
                            'เงื่อนไขการเข้าร่วมมาตรการ',
                            style: cTATSanaChonBoldTextStyle(cBlack, 18.0),
                          ),
                        ),
                        Html(
                          data: """${api.condition}""",
                          defaultTextStyle:
                              cTATSanaSuksaTextStyle(cBlack, 18.0),
                        ),
                      ],
                    ),
                  ),
                  LogoBoxSection(),
                  LogoCirCleSection(),
                  Container(
                    color: Colors.grey[50],
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Footer1Section(),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      color: cBlue,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Footer2Section())
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(color: cShadow, blurRadius: 10)
                      ]),
                      child: CustomAppbar()),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}
