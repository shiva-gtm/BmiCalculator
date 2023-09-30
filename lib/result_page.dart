import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                // padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0x308D8E98),
                ),
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        resultText.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          'Normal BMI range:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      interpretation,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputPage(),
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
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
