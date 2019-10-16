import 'package:ArloTimer/Pages/Clock.dart';
import 'package:flutter/material.dart';
import 'Stopwatch.dart';

class AppPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    PageController _controller = PageController();


    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: <Widget>[

        //Clock 
        Clock(), 


        //Stopwatch 
        StopWatch(),
          //Tap once to start - turns green 
          //Double tap to pause - turns grey 
          //Long press to restart / stop - turns white? 

        //Timer 

        //Instructions and settings 


      ]
    );

  }
}