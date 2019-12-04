

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender;
  int height = 180;
  int weight = 80;
  int age = 18;
  bool continuousExecutable;

  _updateColor(Gender gender) {
    _selectedGender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTapPressed: () {
                      setState(() {
                        _updateColor(Gender.male);
                      });
                    },
                    colour: _selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      genderText: 'male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTapPressed: () {
                      setState(() {
                        _updateColor(Gender.female);
                      });
                    },
                    colour: _selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      genderText: 'female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      //overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                  if (weight > 0) setState(() {weight--;});
                              },
                              longPressStart: (event) {
                                //weight minus button is on  hold
                                continuousExecutable = true;
                                Function minusWeight = (){
                                  if(weight>0){setState(() {weight--;});}
                                };
                                callContinuous(minusWeight);
                              },
                              longPressEnd: (event){continuousExecutable=false;},
                            ),
                            SizedBox(width: 10.0,),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              longPressStart: (event) {
                                //weight plus button is on hold
                                continuousExecutable = true;
                                Function plusWeight = (){
                                  setState(() {weight++;});;
                                };
                                callContinuous(plusWeight);
                              },
                              longPressEnd: (event){continuousExecutable=false;},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                  if (age > 0) setState(() {age--;});
                              },
                              longPressStart: (event) {
                                //age minus button is on hold
                                continuousExecutable = true;
                                Function minusAge = (){
                                  if(age>0){setState(() {age--;});}
                                };
                                callContinuous(minusAge);
                              },
                              longPressEnd: (event){continuousExecutable=false;},
                            ),
                            SizedBox(width: 10.0,),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {age++;});
                              },
                              longPressStart: (event) {
                                //age plus button is on hold
                                continuousExecutable = true;
                                Function plusAge = (){
                                  setState(() {age++;});
                                };
                                callContinuous(plusAge);
                              },
                              longPressEnd: (event){continuousExecutable=false;},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new BottomButton(text: 'CALCULATE', onTap: (){
            CalculatorBrain calculatorBrain = CalculatorBrain(height, weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              result: calculatorBrain.calculateBMI(),
              resultText: calculatorBrain.getResult(),
              interpretation: calculatorBrain.getInterpretation(),
            ),));
          },),
        ],
      ),
    );
  }

  Future<void> callContinuous(Function toBeCall){
    toBeCall();
    return Future.delayed(Duration(milliseconds: 100,), (){if(continuousExecutable){callContinuous(toBeCall);}});
  }



}



class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {this.icon, this.onPressed, this.longPressStart, this.longPressEnd});
  final IconData icon;
  final Function onPressed;
  final Function longPressStart;
  final Function longPressEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: longPressStart,
      onLongPressEnd: longPressEnd,
      onTap: (){onPressed();},
      child: RawMaterialButton(
        onPressed: null,
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        child: Icon(icon),
        fillColor: Color(0xFF4C4F5E),
        shape: CircleBorder(),
      ),
    );
  }
}