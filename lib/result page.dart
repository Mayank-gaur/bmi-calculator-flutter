import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable card.dart';
import 'bottom button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiresult, this.resultText,this.interpretation});
  final String bmiresult;
  final String resultText;
  final  String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch  ,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Result',style: kTitleTextStyle,),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReUsableCode(
              colour: kactivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),style: kresultTextStyle,
                  ),
                  Text(
                    bmiresult,
                    style: kBMITextSTyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                  ),
                  BottomButton(buttontitle: 'RE-CALCULATE', ontap:() {Navigator.pop(context);}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
