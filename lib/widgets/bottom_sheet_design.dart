import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

import '../constants.dart';
import '../providers/my_provider.dart';

class BottomSheetDesign extends StatefulWidget {
  const BottomSheetDesign({super.key});

  @override
  State<BottomSheetDesign> createState() => _BottomSheetDesignState();
}

class _BottomSheetDesignState extends State<BottomSheetDesign> {
  final titleTextController = TextEditingController();
  final shortDescriptionTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  Widget reusableTextField(
      {required String labelText,
      required TextEditingController myController,
      required TextInputAction textInputAction,
      int? maxLines}) {
    return TextField(
      controller: myController,
      style: kBottomSheetTextStyle,
      textInputAction: textInputAction,
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

  Widget reusableButton(
      {required String buttonText, required VoidCallback onTapFunction}) {
    return GestureDetector(
      onTap: onTapFunction,
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

  void addTileAndCloseSheet() {
    provider.Provider.of<MyProvider>(context, listen: false).addTile(
      titleText: titleTextController.text,
      shortDescriptionText: shortDescriptionTextController.text,
      descriptionText: descriptionTextController.text,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleTextController.dispose();
    shortDescriptionTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          //so when keyboard appers it pushes the sheet up
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            reusableTextField(
              labelText: 'Enter Title',
              myController: titleTextController,
              textInputAction: TextInputAction.next,
              maxLines: 1,
            ),
            const SizedBox(height: 15),
            reusableTextField(
              labelText: 'Enter Short Description',
              myController: shortDescriptionTextController,
              textInputAction: TextInputAction.next,
              maxLines: 1,
            ),
            const SizedBox(height: 15),
            reusableTextField(
              labelText: 'Enter Description',
              myController: descriptionTextController,
              textInputAction: TextInputAction.newline,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                reusableButton(
                  buttonText: 'Add',
                  onTapFunction: addTileAndCloseSheet,
                ),
                reusableButton(
                  buttonText: 'Close',
                  onTapFunction: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
