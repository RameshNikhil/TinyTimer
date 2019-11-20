import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import './SizeConfig.dart';
import './Pages/AppPages.dart';
import 'Routes/FadeRoute.dart';

// show debugDefaultTargetPlatformOverride;

void main() {
  debugShowCheckedModeBanner:
  false;
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, FadeRouteBuilder(page: AppPages()));
  }

  // When this object is loaded into the tree, call startTime() which will start a timer for 2 seconds and execute the build function 
  // After the 2 seconds, call navigationPage() which will take you to the main page 
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
        body: new Container(
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
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "tiny",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 15,
                      fontFamily: "Quicksand",
                      color: Color(0xff67685a),
                    ),
                  ),
                  Text(
                    "Timer",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 16,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff67685a),
                    ),
                  ),
                ],
              ),
            )));
  }
}
