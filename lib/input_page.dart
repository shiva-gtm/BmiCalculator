import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'claculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

int height = 180;
int weight = 50;
int age = 18;

Gender? selectedGender;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: const GenderCard(
                      gender: 'MALE',
                      genderIcon: Icon(
                        Icons.male,
                        size: kIconSize,
                      ),
                    ),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: const GenderCard(
                      gender: 'FEMALE',
                      genderIcon: Icon(
                        Icons.female,
                        size: kIconSize,
                      ),
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onpress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.remove,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: kBottomContainerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  const RoundActionButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      elevation: 6.0,
      child: Icon(
        icon,
        size: 40,
      ),
    );
  }
}
