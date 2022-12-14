import 'package:flutter/material.dart';

import './closed_tile.dart';
import './opened_tile.dart';

class MyAnimatedContainer extends StatefulWidget {
  final String titleText;
  final String shortDescriptionText;
  final String descriptionText;
  final VoidCallback deleteTileFunction;

  const MyAnimatedContainer(
      {super.key,
      required this.titleText,
      required this.shortDescriptionText,
      required this.descriptionText,
      required this.deleteTileFunction});

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  bool isTileClosed = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTileClosed = !isTileClosed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutSine,
        height: isTileClosed ? 75 : 300,
        child: SingleChildScrollView(
          child: isTileClosed
              ? ClosedTile(
                  titleText: widget.titleText,
                  shortDescriptionText: widget.shortDescriptionText,
                  deleteTileFunction: widget.deleteTileFunction,
                )
              : OpenedTile(
                  titleText: widget.titleText,
                  descriptionText: widget.descriptionText,
                ),
        ),
      ),
    );
  }
}
