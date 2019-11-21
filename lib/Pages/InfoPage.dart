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
                size: 6,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0, top: 20.0),
                child: BaseText(
                  text: "https://github.com/RameshNikhil",
                  size: 3,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                           BaseText(
                        text: " Clock | ",
                        size: 1.5,
                      ),

                       BaseText(
                        text: "This is the current system time.",
                        size: 1,
                      )

                        ],
                      )
                      
                      ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BaseText(
                      text:
                          "                       Stopwatch | ",
                      size: 1.5,
                    ),
                    BaseText(
                      text:
                          "Tap once to start. Tap again to pause. Long press to reset.",
                      size: 1,
                    ),
                      ],
                    )
                    
                    
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          BaseText(
                        text:
                            "         Timer | ",
                        size: 1.5,
                      ),
                      BaseText(
                        text:
                            "Issues with seleting time - will fix soon.",
                        size: 1,
                      ),

                        ],
                      )
                      
                      
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: SizeConfig.blockSizeHorizontal * 1,
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
            ],
          ),
        ),
      ),
    );
  }
}
