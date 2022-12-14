import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

import '../constants.dart';
import '../providers/my_provider.dart';
import '../widgets/my_animated_container.dart';
import '../widgets/bottom_button.dart';
import '../widgets/bottom_sheet_design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget myDivider() {
    return const Divider(
      height: 14,
      thickness: 3,
      color: kTertiaryColor,
      indent: 15,
      endIndent: 15,
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
                builder: (context, myProvider, child) => ListView.separated(
                  itemBuilder: (context, index) => MyAnimatedContainer(
                    titleText: myProvider.getTileTitle(index),
                    shortDescriptionText:
                        myProvider.getTileShortDescription(index),
                    descriptionText: myProvider.getTileDescription(index),
                    deleteTileFunction: () => myProvider.deleteTile(index),
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: myProvider.getTilesLength,
                ),
              ),
            ),
            BottomButton(
              onTapFunction: () => showModalBottomSheet(
                backgroundColor: kPrimaryColor,
                isScrollControlled: true,
                context: context,
                builder: (context) => const BottomSheetDesign(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
