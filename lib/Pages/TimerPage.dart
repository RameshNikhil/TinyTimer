import 'package:TinyTimer/BaseText.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiver/async.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TimerPage extends StatefulWidget {
  var pgController;
  TimerPage({this.pgController});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  String systemTime = "00:00:00";
  Timer _everySecond;
  Timer _everyHour;
  var timeInput;

  final timeInputController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   // defines a timer
  //   _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
  //     setState(() {
  //       systemTime = DateFormat('hh:mm:ss a').format(DateTime.now());
  //     });
  //   });
  // }

  final format = DateFormat("HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BaseText(
                    text: systemTime,
                    size: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: timeInputController,
                          decoration: InputDecoration(labelText: "Enter time"),
                        ),
                        RaisedButton(
                          onPressed: () {
                            var tempTime = Text(timeInputController.text);
                          },
                        )
                      ],
                    ),
                  ),
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

// /* Countdown Timer */

// int _start = 10;
// int _current = 10;

// void startTimer() {
//   CountdownTimer countDownTimer = new CountdownTimer(
//     new Duration(seconds: _start),
//     new Duration(seconds: 1),
//   );

//   var sub = countDownTimer.listen(null);
//   sub.onData((duration) {
//     // setState(() { _current = _start - duration.elapsed.inSeconds; });
//   });

//   sub.onDone(() {
//     print("Done");
//     sub.cancel();
//   });
// }

// Widget build(BuildContext context) {
//   return new Scaffold(
//     appBar: AppBar(title: Text("Timer test")),
//     body: Column(
//       children: <Widget>[
//         RaisedButton(
//           onPressed: () {
//             startTimer();
//           },
//           child: Text("start"),
//         ),
//         Text("$_current")
//       ],
//     ),
//   );
// }
