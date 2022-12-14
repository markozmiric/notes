import 'package:flutter/material.dart';

import '../constants.dart';

class ClosedTile extends StatelessWidget {
  final String titleText;
  final String shortDescriptionText;
  final VoidCallback deleteTileFunction;

  const ClosedTile(
      {super.key,
      required this.titleText,
      required this.shortDescriptionText,
      required this.deleteTileFunction});

  Widget trashcanButton(VoidCallback onTapFunction) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kTertiaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    titleText,
                    style: kTitleTextStyle,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    shortDescriptionText,
                    style: kShortDescriptionTextStyle,
                  ),
                ),
              ],
            ),
          ),
          trashcanButton(deleteTileFunction),
        ],
      ),
    );
  }
}
