import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiresult,required this.interPretation,required this.resultText});

  final String bmiresult;
  final String resultText;
  final String interPretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Result',
          ),
        ),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(

              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  
                  'Your Result',
                  style: kLargeButtonStyle,
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: kResultStyle,
                      ),
                      Text(
                        bmiresult,
                        style: kBMItStyle,
                      ),
                      Text(
                        interPretation,
                        style: kLabeltextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  colour: activeColor,
                )),
            BottomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'Re-Calculate',
            ),
          ],
        ));
  }
}
