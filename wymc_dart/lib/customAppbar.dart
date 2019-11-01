import 'package:flutter/material.dart';
import 'package:wymc_dart/api.dart';
import 'package:wymc_dart/color.dart';
import 'package:wymc_dart/images.dart';
import 'package:wymc_dart/textstyle.dart';

import 'dart:html' as html;

class CustomAppbar extends StatefulWidget {
  CustomAppbar({Key key}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isSmall = width < 576;
    bool isMedium = width < 768;
    return isSmall
        ? Container(
            color: cWhite,
            width: width,
            child: ExpansionTile(
              backgroundColor: cWhite,
              onExpansionChanged: (isExpanding) {
                isExpanding
                    ? _animationController.forward()
                    : _animationController.reverse();
              },
              title: null,
              trailing: AnimatedIcon(
                color: cBlack,
                progress: _animationController,
                icon: AnimatedIcons.menu_close,
              ),
              leading: Container(height: 50, child: footerImg),
              children: <Widget>[
                Container(
                  color: cWhite,
                  child: ListTile(
                      trailing: NavTopic(
                    label: api.navItem1Label,
                    href: api.navItem1href,
                    textColor: cBlack,
                    textColorOnHover: cBlack,
                  )),
                ),
                Container(
                  color: cWhite,
                  child: ListTile(
                      trailing: NavTopic(
                    label: api.navItem2Label,
                    href: api.navItem2href,
                    textColor: cBlack,
                    textColorOnHover: cBlack,
                  )),
                ),
                Container(
                  color: cWhite,
                  child: ListTile(
                      trailing: NavTopic(
                    label: api.navItem3Label,
                    href: api.navItem3href,
                    textColor: cBlack,
                    textColorOnHover: cBlack,
                  )),
                ),
              ],
            ),
          )
        : Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: isMedium ? width * 0.05 : width*0.15),
            width: width,
            color: cWhite,
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    child: NavTopicAnimated(
                  navTopic: NavTopic(
                    label: api.navItem1Label,
                    href: api.navItem1href,
                    textColor: cBlack,
                    textColorOnHover: cBlue,
                  ),
                )),
                Expanded(
                  child: NavTopicAnimated(
                      navTopic: NavTopic(
                    label: api.navItem2Label,
                    href: api.navItem2href,
                    textColor: cBlack,
                    textColorOnHover: cBlue,
                  )),
                ),
                Expanded(
                  child: NavTopicAnimated(
                      navTopic: NavTopic(
                    label: api.navItem3Label,
                    href: api.navItem3href,
                    textColor: cBlack,
                    textColorOnHover: cBlue,
                  )),
                ),
              ],
            ),
          );
  }
}

class NavTopic extends StatefulWidget {
  NavTopic(
      {Key key, this.label, this.href, this.textColor, this.textColorOnHover})
      : super(key: key);

  String label, href;
  Color textColor, textColorOnHover;

  @override
  _NavTopicState createState() => _NavTopicState();
}

class _NavTopicState extends State<NavTopic> {
  Color textColor;
  @override
  void initState() {
    textColor = widget.textColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (isHover) {
        setState(() {
          !isHover
              ? textColor = widget.textColor
              : textColor = widget.textColorOnHover;
        });
      },
      child: Text(
        widget.label,
        style: cTATSanaChonBoldTextStyle(textColor, 14.0),
      ),
      onTap: () {
        html.window.open(widget.href, '_blank');
      },
    );
  }
}

class NavTopicAnimated extends StatefulWidget {
  NavTopicAnimated({Key key, this.navTopic}) : super(key: key);

  Widget navTopic;

  @override
  _NavTopicAnimatedState createState() => _NavTopicAnimatedState();
}

class _NavTopicAnimatedState extends State<NavTopicAnimated> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    isHover = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {},
      onHover: (isHover) {
        setState(() {
          this.isHover = isHover;
        });
      },
      child: Center(
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            widget.navTopic,
            SizedBox(
              height: 5,
            ),
            AnimatedContainer(
              color: cBlue,
              height: 5,
              width: isHover ? width * 0.2 : 0,
              duration: Duration(milliseconds: 300),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
