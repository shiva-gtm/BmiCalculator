import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_card.dart';

const bottomContainerHeight = 70.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const iconSize = 80.0;
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

Color maleColor = inactiveCardColor;
Color femaleColor = inactiveCardColor;

//1 male 2 female
void updateColor(int gender) {
  if (gender == 1) {
    maleColor = activeCardColor;
    femaleColor = inactiveCardColor;
  } else {
    femaleColor = activeCardColor;
    maleColor = inactiveCardColor;
  }
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      cardChild: const GenderCard(
                        gender: 'MALE',
                        genderIcon: Icon(
                          Icons.male,
                          size: iconSize,
                        ),
                      ),
                      colour: maleColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      cardChild: const GenderCard(
                        gender: 'FEMALE',
                        genderIcon: Icon(
                          Icons.female,
                          size: iconSize,
                        ),
                      ),
                      colour: femaleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(""),
                ],
              ),
              colour: activeCardColor,
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(),
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(),
                    colour: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: bottomContainerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: bottomContainerHeight,
            child: const Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
