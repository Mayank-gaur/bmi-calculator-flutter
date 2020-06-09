import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon content.dart';
import 'reusable card.dart';
import 'constants.dart';
import 'result page.dart';
import 'bottom button.dart';
import 'bmi brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 120;
  int weight = 60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCode(
                    onpress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? kactivecardcolor
                        : kinactivecolor,
                    cardchild: Center(
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ReUsableCode(
                  onpress: () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  colour: selectedgender == Gender.female
                      ? kactivecardcolor
                      : kinactivecolor,
                  cardchild: Center(
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReUsableCode(
              colour: kactivecardcolor,
              cardchild: Column(
                children: <Widget>[
                  Text(
                    'height',
                    style: klabelTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: knumberTextstyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextstyle,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          }),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
                  children: <Widget>[
                Expanded(
                    child: ReUsableCode(
                  colour: kactivecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: klabelTextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: knumberTextstyle,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                          setState(() {
                            weight++;
                          });
                            },
                          ),

                        ]),
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReUsableCode(
                    colour: kactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: klabelTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberTextstyle,
                        ),
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),

                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomButton(buttontitle: 'CALCULATE',ontap:(){
              CalculatorBrain calc = CalculatorBrain(height:  height,weight: weight);
              Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultPage(
                bmiresult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
              },)

          ],
        ));
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 30.0,
        height: 30.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




Column(
children: <Widget>[
Text(
'height',
style: klabelTextstyle,
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.baseline,
textBaseline: TextBaseline.alphabetic,
children: <Widget>[
Text(
height.toString(),
style: knumberTextstyle,
),
Text(
'cm',
style: klabelTextstyle,
),
],
),
Expanded(
child: SliderTheme(
data: SliderTheme.of(context).copyWith(
activeTrackColor: Colors.white,
thumbColor: Color(0xFFEB1555),
overlayColor: Color(0x29EB1555),
thumbShape:
RoundSliderThumbShape(enabledThumbRadius: 15),
overlayShape:
RoundSliderOverlayShape(overlayRadius: 30),
),
child: Slider(
value: height.toDouble(),
min: 120,
max: 220,
activeColor: Colors.red,
inactiveColor: Colors.grey,
onChanged: (double newvalue) {
setState(() {
height = newvalue.round();
});
}),
),
),
],
),