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

    // // time of day
    // _everyHour = Timer.periodic(Duration(hours: 1), (Timer t) {
    //   setState(() {
    //     timeOfDay = DateFormat('a').format(DateTime.now());
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment(1.0, 1.0),
        //     end: Alignment(-1.0, -1.0),
        //     stops: [0.1, 0.9],
        //     colors: [
        //       Color(0xffd8d8d8),
        //       Color(0xffd5e1ed),
        //     ],
        //   ),
        // ),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(systemTime,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 16,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff67685a))),

                  // Text(" " + timeOfDay,
                  //     style: TextStyle(
                  //         fontSize: SizeConfig.blockSizeHorizontal * 8,
                  //         fontFamily: "Quicksand",
                  //         fontWeight: FontWeight.bold,
                  //         color: Color(0xff67685a))),
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
