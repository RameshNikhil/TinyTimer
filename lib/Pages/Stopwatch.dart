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
  String stopTime = "0";
  Color _color = Colors.white;
    
    
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    

    
   
    return Material(

      child: InkWell(
         child: Container(
        color: _color,
    
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(stopTime,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 14,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff67685a)
                      )),
            ],
          ),
        ),
      ),

      onTap: (){
        _stopwatch.start();

        Duration elapsed = _stopwatch.elapsed;

         Timer _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        stopTime = elapsed.toString();
      });
    });




      },

    


      ),

     


    );



  }
}

