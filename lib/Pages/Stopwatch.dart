import 'package:TinyTimer/BaseText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';

class StopWatch extends StatefulWidget {
  var pgController;
  StopWatch({this.pgController});

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
          duration: Duration(milliseconds: 200),
          color: _color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                BaseText(text: _time, size: 20,), 

                // Padding(
                //     padding: EdgeInsets.only(bottom: 8.0,),
                //     child:  BaseText(text: "stopwatch", size: 2,),
                //   ),

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
        onTap: () {
          String elapsedString;

          if (_clickIn == false) {
            _clickIn = true;
            _stopwatch.start();

            setState(() {
              _color = Color(0xffa4d15c);
            });

            Timer _everySecond =
                Timer.periodic(Duration(seconds: 1), (Timer t) {
              elapsed = _stopwatch.elapsed;
              elapsedString = elapsed.toString().substring(0, 7);
              setState(() {
                _time = elapsedString;
              });
            });
          } else {
            _clickIn = false;

            _stopwatch.stop();
            String elapsedStringStop =
                _stopwatch.elapsed.toString().substring(0, 7);

            setState(() {
              _color = Color(0xfff05026);
              _time = elapsedStringStop;
            });
          }
        },
        onDoubleTap: () {
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
