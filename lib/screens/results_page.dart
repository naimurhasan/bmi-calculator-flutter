import 'package:bmi_calculator/components/bottom_button.dart';

import '../constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.result,@required this.interpretation,@required this.resultText});

  final String resultText;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 13.0),
                child: Text('Your Result', style: kNumberTextStyle,),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: kActiveCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(resultText, style: TextStyle(color: Colors.greenAccent,fontSize: 18.0,),),
                        Text(result, style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900),),
                        Text(interpretation,textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 18.0),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BottomButton(text: 'RE-CALCULATE', onTap: (){
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
