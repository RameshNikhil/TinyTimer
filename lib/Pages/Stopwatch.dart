import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';

class StopWatch extends StatefulWidget {
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<StopWatch> {
  var _stopwatch = Stopwatch();
  String _time = "0:00:00";
  Color _color = Colors.white;
  Duration elapsed;

  var _clickIn = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: InkWell(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color: _color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_time,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 20,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff67685a))),
              ],
            ),
          ),
        ),
        onTap: () {
          
          String elapsedString;

          if (_clickIn == false) {

            _clickIn = true;
            _stopwatch.start();

          setState(() {
            _color = Color(0xffa4d15c);
          });
          
          Timer _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
            elapsed = _stopwatch.elapsed;
            elapsedString = elapsed.toString().substring(0,7);
            setState(() {
              _time = elapsedString;
            });
          });

          } else {
            _clickIn = false;

             _stopwatch.stop();
          String elapsedStringStop = _stopwatch.elapsed.toString().substring(0,7);

          setState(() {
            _color = Color(0xfff05026);
            _time = elapsedStringStop;
          });

          }

        

        },
        onDoubleTap: (){

          // _stopwatch.stop();
          // String elapsedString = _stopwatch.elapsed.toString().substring(0,7);

          // setState(() {
          //   _color = Color(0xfff05026);
          //   _time = elapsedString;
          // });

          _clickIn = false;
          _stopwatch.reset();
          setState(() {
            _color = Colors.white;
            _time = "0:00:00";
          });     

        },
        // onLongPress: (){
        //   _stopwatch.reset();
        //   setState(() {
        //     _color = Colors.white;
        //     _time = "0:00:00";
        //   });          
        // },
      ),
    );
  }
}
