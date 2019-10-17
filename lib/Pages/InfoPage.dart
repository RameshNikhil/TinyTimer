import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:TinyTimer/BaseText.dart';

class InfoPage extends StatefulWidget {
  var pgController;
  InfoPage({this.pgController});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseText(
                text: "tinyTimer",
                size: 10,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: BaseText(
                  text: "by Nikhil Ramesh",
                  size: 4,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    text: "1. Clock : This is the current system time.",
                    size: 2,
                  ),
                  BaseText(
                    text:
                        "2. Stopwatch : Tap once to start. Tap again to pause. Double tap to reset. ",
                    size: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: BaseText(
                      text:
                          "3. Timer : Select time then double click to start. Long press to stop and reset.",
                      size: 2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: BaseText(
                  text: "Check me out on my github: RameshNikhil",
                  size: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          size: SizeConfig.blockSizeHorizontal * 2,
                          color: Color(0xff67685a).withOpacity(0.6),
                        ),
                        onTap: () {
                          widget.pgController.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease);
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
