import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.ontap,this.buttontitle});

  final Function ontap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SafeArea(
        child: Container(
          child: Center(child: Text(buttontitle,style: kLargeButtonTextStyle,)),
          color: kbottomcontainercolor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: kbottomcontainerheight,
        ),
      ),
    );
  }
}