import 'package:flutter/material.dart';
import '../constants.dart';

class OpenedTile extends StatelessWidget {
  final String titleText;
  final String descriptionText;

  const OpenedTile(
      {super.key, required this.titleText, required this.descriptionText});

  Widget titleContainer({required String titleText}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kTertiaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          titleText,
          style: kTitleTextStyle,
        ),
      ),
    );
  }

  Widget descriptionContainer({required String descriptionText}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kTertiaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            descriptionText,
            style: kDescriptionTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 300,
        color: kPrimaryColor,
        child: Column(
          children: [
            titleContainer(titleText: titleText),
            const SizedBox(height: 15),
            descriptionContainer(descriptionText: descriptionText),
          ],
        ),
      ),
    );
  }
}
