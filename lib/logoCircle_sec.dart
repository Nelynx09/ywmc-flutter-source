import 'package:flutter/material.dart';
import 'package:wymc_dart/images.dart';

class LogoCirCleSection extends StatelessWidget {
  const LogoCirCleSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.0),
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 300,
            child: Row(
              children: getLogoCircle(1),
            ),
          ),
          Container(width: 300, child: Row(children: getLogoCircle(2)))
        ],
      ),
    );
  }

  List<Widget> getLogoCircle(int part) {
    List<Widget> part1 = [
      Expanded(
        child: Padding(padding: const EdgeInsets.all(16.0), child: mofImg),
      ),
      Expanded(
        child: Padding(padding: const EdgeInsets.all(16.0), child: fpoImg),
      ),
      Expanded(
        child: Padding(padding: const EdgeInsets.all(16.0), child: cgdImg),
      ),
    ];
    List<Widget> part2 = [
      Expanded(
        child:
            Padding(padding: const EdgeInsets.all(16.0), child: krungthaiImg),
      ),
      Expanded(
        child: Padding(padding: const EdgeInsets.all(16.0), child: motsImg),
      ),
      Expanded(
        child: Padding(padding: const EdgeInsets.all(16.0), child: tatImg),
      ),
    ];
    return part == 1 ? part1 : part2;
  }
}
