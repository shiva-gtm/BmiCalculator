import 'package:flutter/material.dart';

const iconNameColor = Color(
  0xFF8D8E98,
);

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
          style: const TextStyle(
            fontSize: 22,
            color: iconNameColor,
          ),
        ),
      ],
    );
  }
}
