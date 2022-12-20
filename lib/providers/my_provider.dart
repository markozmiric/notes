import 'package:flutter/material.dart';

import '../models/tile_model.dart';
import '../database/my_database.dart';

class MyProvider extends ChangeNotifier {
  MyDatabase myDB = MyDatabase();
  late final List _tiles;

  String getTileTitle(int index) => _tiles[index].title;
  String getTileShortDescription(int index) => _tiles[index].shortDescription;
  String getTileDescription(int index) => _tiles[index].description;
  int get getTilesLength => _tiles.length;

  void getDataFromDatabase() {
    _tiles = myDB.getDataFromDatabase();
  }

  void addTile(
      {required String titleText,
      required String shortDescriptionText,
      required String descriptionText}) {
    TileModel newTile = TileModel(
        title: titleText,
        shortDescription: shortDescriptionText,
        description: descriptionText);

    _tiles.add(newTile);

    myDB.updateDatabase(_tiles);

    notifyListeners();
  }

  void deleteTile(int index) {
    _tiles.remove(_tiles[index]);

    myDB.updateDatabase(_tiles);

    notifyListeners();
  }
}
