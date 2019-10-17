import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';

class StopWatch extends StatefulWidget {
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<StopWatch> {
  var _stopwatch = Stopwatch();
  String _time = "0";
  Color _color = Colors.white;
  Duration elapsed;

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
          _stopwatch.start();
          String elapsedString;
          
          Timer _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
            elapsed = _stopwatch.elapsed;
            elapsedString = elapsed.toString().substring(0,7);
            setState(() {
              _color = Color(0xffa4d15c);
              _time = elapsedString;
            });
          });
        

        },
        onDoubleTap: (){

          _stopwatch.stop();
          String elapsedString;
          
          Timer _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
             elapsedString = _stopwatch.elapsed.toString().substring(0,7);
            setState(() {
              _color = Color(0xfff05026);
              _time = elapsedString;
            });
          });
         

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
