import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

import '../constants.dart';
import '../providers/my_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget tile(
      String titleText, String shortDescriptionText, VoidCallback function) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 75,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              //Expanded is here because of the TextOverflow.ellipsis
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: kTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    shortDescriptionText,
                    style: kShortDescriptionTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            trashcanButton(function),
          ],
        ),
      ),
    );
  }

  Widget trashcanButton(VoidCallback onPressFunction) {
    return GestureDetector(
      onTap: onPressFunction,
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

  Widget tileWithDivider(
      String titleText, String shortDescriptionText, VoidCallback function) {
    return Column(
      children: [
        const Divider(
          height: 14,
          thickness: 3,
          color: kTertiaryColor,
          indent: 15,
          endIndent: 15,
        ),
        tile(titleText, shortDescriptionText, function),
      ],
    );
  }

  Widget bottomButton(VoidCallback onPressFunction) {
    return GestureDetector(
      onTap: onPressFunction,
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
          style: kBottomButtonTextStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: provider.Consumer<MyProvider>(
                builder: (context, myProvider, child) => ListView.builder(
                  itemBuilder: (context, index) => (index == 0)
                      ? tile(
                          myProvider.getTileTitle(index),
                          myProvider.getTileShortDescription(index),
                          () {
                            myProvider.deleteTile(index);
                          },
                        )
                      : tileWithDivider(
                          myProvider.getTileTitle(index),
                          myProvider.getTileShortDescription(index),
                          () {
                            myProvider.deleteTile(index);
                          },
                        ),
                  itemCount: myProvider.getLength,
                ),
              ),
            ),
            bottomButton(
                provider.Provider.of<MyProvider>(context, listen: false)
                    .addTile),
          ],
        ),
      ),
    );
  }
}
