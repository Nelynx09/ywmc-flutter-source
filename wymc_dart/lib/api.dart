import 'dart:convert';

import 'package:http/http.dart' as http;

Api api = Api();

class Api {
  String duration = "duration text";
  String detail = "detail text";
  String condition = "condition text";

  String navItem1Label = "nav item 1";
  String navItem1href = "";

  String navItem2Label = "nav item 2";
  String navItem2href = "";

  String navItem3Label = "nav item 3";
  String navItem3href = "";

  Future getApi() async {
    final response = await http.get('https://panjs.com/ywc.json');

    String data = utf8.decode(response.bodyBytes);
    Map map = json.decode(data);

    duration = map["duration"];
    detail = map["detail"];
    condition = map["condition"];

    navItem1Label = map["navbarItems"][0]["label"];
    navItem1href = map["navbarItems"][0]["href"];

    navItem2Label = map["navbarItems"][1]["label"];
    navItem2href = map["navbarItems"][1]["href"];

    navItem3Label = map["navbarItems"][2]["label"];
    navItem3href = map["navbarItems"][2]["href"];
  }
}
