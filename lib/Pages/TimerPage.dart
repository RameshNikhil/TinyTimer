import 'package:TinyTimer/BaseText.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TimerPage extends StatefulWidget {
  var pgController;
  TimerPage({this.pgController});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  String systemTime;
  Timer _everySecond;
  String timeOfDay;
  Timer _everyHour;

  @override
  void initState() {
    super.initState();

    // sets first value
    systemTime = DateFormat('hh:mm:ss a').format(DateTime.now());
    timeOfDay = DateFormat('a').format(DateTime.now());

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        systemTime = DateFormat('hh:mm:ss a').format(DateTime.now());
      });
    });


  }

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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  BaseText(text: systemTime, size: 16.0,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0,),
                    child:  BaseText(text: "timer", size: 2,),
                  ),
                 
                  

                ],
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
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_forward,
                          size: SizeConfig.blockSizeHorizontal * 2,
                          color: Color(0xff67685a).withOpacity(0.6),
                        ),
                        onTap: () {
                          widget.pgController.nextPage(
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
