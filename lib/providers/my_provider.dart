import 'package:flutter/foundation.dart';

import '../models/tile_model.dart';

class MyProvider extends ChangeNotifier {
  final List<TileModel> _tiles = [
    TileModel(
      title: 'animated container 1111111111111111',
      shortDescription: 'widget animation 11111111111111111',
      description:
          'i saw it on youtube, it animets container to change in size',
    ),
    TileModel(
      title: '2222222222',
      shortDescription: '222222222222',
      description:
          'i saw it on youtube, it animets container to change in size',
    ),
  ];

  String getTileTitle(int index) => _tiles[index].title;
  String getTileShortDescription(int index) => _tiles[index].shortDescription;
  String getTileDescription(int index) => _tiles[index].description;
  int get getLength => _tiles.length;

  void addTile() {
    TileModel newTile = TileModel(
      title: 'new',
      shortDescription: 'new',
      description: 'new',
    );

    _tiles.add(newTile);
    notifyListeners();
  }

  void deleteTile(int index) {
    _tiles.remove(_tiles[index]);
    notifyListeners();
  }
}
