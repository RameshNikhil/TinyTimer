import 'package:TinyTimer/Pages/InfoPage.dart';
import './Clock.dart';
import 'package:flutter/material.dart';
import 'Stopwatch.dart';
import 'TimerPage.dart';

class AppPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          //Clock
          Clock(pgController: _controller),

          //Stopwatch
            //Tap once to start - turns green
            //Tap again to pause - turns red
            //Double tap to restart / stop - turns white
          StopWatch(pgController: _controller),
          

          //Timer
            //TODO : Fix this
            //! This page is commented out until fixed
          //TimerPage(pgController: _controller),

          //Instructions and settings
          InfoPage(
            pgController: _controller,
          )

        ]);
  }
}
