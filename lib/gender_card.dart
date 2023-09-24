import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key, required this.gender, required this.genderIcon});

  final String gender;
  final Icon genderIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genderIcon,
        const SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
