import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcButon extends StatelessWidget {
String text;
Function onBtnClicked;
CalcButon(this.text,this.onBtnClicked);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
      onPressed: () {
onBtnClicked(text);
      },
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),),
      color: Colors.blue,
    ));
  }
}
