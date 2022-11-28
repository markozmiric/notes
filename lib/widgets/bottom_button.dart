import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTapFunction;

  const BottomButton({super.key, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Add New',
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
