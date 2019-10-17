import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String systemTime;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    systemTime = DateFormat('hh:mm:ss').format(DateTime.now());

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        systemTime = DateFormat('hh:mm:ss').format(DateTime.now());
      });
    });
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
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(systemTime,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 20,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff67685a)
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
