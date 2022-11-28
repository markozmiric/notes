import 'package:flutter/material.dart';

import '../constants.dart';

class BottomSheetDesign extends StatelessWidget {
  const BottomSheetDesign({super.key});

  Widget reusableTextField(String labelText, int? maxLines) {
    return TextField(
      style: kBottomSheetTextStyle,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        labelStyle: kBottomSheetLabelTextStyle,
        filled: true,
        fillColor: kTertiaryColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  Widget reusableButton(String buttonText) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          buttonText,
          style: kButtonTextStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            reusableTextField('Enter Title', 1),
            const SizedBox(height: 15),
            reusableTextField('Enter Short Description', 1),
            const SizedBox(height: 15),
            reusableTextField('Enter Description', null),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                reusableButton('Add'),
                reusableButton('Close'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
