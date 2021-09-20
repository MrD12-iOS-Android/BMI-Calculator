import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_data.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icons.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender {
  male,
  female,
}

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  _BMI_CalculatorState createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;
  int height = 180;
  int weight = 60;
  int age = 30;

  // 1 = male, 2 = female
  void updateColor(int selectedGender) {
    // onPressed male
    if (selectedGender == 1) {
      if (maleColor == inactiveColor) {
        maleColor = activeColor;
        femaleColor = inactiveColor;
      } else {
        maleColor = inactiveColor;
      }
    }
    if (selectedGender == 2) {
      if (femaleColor == inactiveColor) {
        femaleColor = activeColor;
        maleColor = inactiveColor;
      } else {
        femaleColor = inactiveColor;
      }
    }
  }

  // Gender selectGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(
                        label: 'Male',
                        icon: FontAwesomeIcons.mars,
                      ),
                      colour: maleColor,
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                     setState(() {
                       updateColor(2);
                     });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(
                        label: 'Female',
                        icon: FontAwesomeIcons.venus,
                      ),
                      colour: femaleColor,
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabeltextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'sm',
                        style: kLabeltextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.black12,
                      activeTrackColor: Colors.yellow,
                      overlayColor: Colors.yellowAccent,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 40),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Colors.red,
                        inactiveColor: Colors.green,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
              colour: Color(0xFF1D1E33),
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabeltextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icons: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icons: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(0xFF1D1E33),
                  )),
                  Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Age',
                              style: kLabeltextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icons: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icons: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: Color(0xFF1D1E33),
                      )),
                ],
              ),
            ),
            BottomButton(
              onPressed: (){
                CalculatorBrain brain = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                    bmiresult: brain.calculateBMI(),
                    interPretation: brain.getInterPretation(),
                    resultText: brain.getresult(),

                )));
              },
              title: 'Calculate',
            ),
          ],
        ));
  }
}
