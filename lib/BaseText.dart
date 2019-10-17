import 'package:flutter/material.dart';
import 'SizeConfig.dart';

class BaseText extends StatelessWidget {
  var text;
  var size;

  BaseText({@required this.text, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal * size,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold,
            color: Color(0xff67685a)));
  }
}
