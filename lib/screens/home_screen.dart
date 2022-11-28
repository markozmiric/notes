import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

import '../constants.dart';
import '../providers/my_provider.dart';
import '../widgets/tile.dart';
import '../widgets/bottom_button.dart';
import '../widgets/bottom_sheet_design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget tileWithDivider(String titleText, String shortDescriptionText,
      VoidCallback deleteTileFunction) {
    return Column(
      children: [
        const Divider(
          height: 14,
          thickness: 3,
          color: kTertiaryColor,
          indent: 15,
          endIndent: 15,
        ),
        Tile(
            titleText: titleText,
            shortDescriptionText: shortDescriptionText,
            deleteTileFunction: deleteTileFunction),
      ],
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
                      ? Tile(
                          titleText: myProvider.getTileTitle(index),
                          shortDescriptionText:
                              myProvider.getTileShortDescription(index),
                          deleteTileFunction: () =>
                              myProvider.deleteTile(index),
                        )
                      : tileWithDivider(
                          myProvider.getTileTitle(index),
                          myProvider.getTileShortDescription(index),
                          () => myProvider.deleteTile(index),
                        ),
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
            /* provider.Provider.of<MyProvider>(context, listen: false)
                        .addTile), */
          ],
        ),
      ),
    );
  }
}
