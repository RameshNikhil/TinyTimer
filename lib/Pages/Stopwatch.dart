import 'package:flutter/material.dart';
import 'package:ArloTimer/SizeConfig.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:ArloTimer/SizeConfig.dart';

class StopWatch extends StatefulWidget {
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<StopWatch> {
  var _stopwatch = Stopwatch();
  String _time = "0";
  Color _color = Colors.white;

  var _clickIn = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: InkWell(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          color: _color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_time,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 14,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff67685a))),
              ],
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _color = Color(0xffa4d15c);
          });
          // _stopwatch.start();
          // int elapsed = _stopwatch.elapsedTicks;
          // Timer _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
          //   setState(() {
          //     _time = elapsed.toString();
          //   });
          // });
          // _clickIn = true; 
        },
        onDoubleTap: (){
          setState(() {
            _color = Color(0xfff05026);
          });
          // _stopwatch.stop();

          // int elapsed = _stopwatch.elapsedTicks;
          // setState(() {
          //   _time = elapsed.toString();
          // });
          // _clickIn = false; 

        },
        onLongPress: (){
          setState(() {
            _color = Colors.white;
          });          
          // _stopwatch.reset(); 
          // setState(() {
          //   _time = "0";
          // });
        },
      ),
    );
  }
}
