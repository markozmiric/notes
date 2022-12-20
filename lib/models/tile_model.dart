import 'package:hive/hive.dart';

part 'tile_model.g.dart';

@HiveType(typeId: 0)
class TileModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String shortDescription;

  @HiveField(2)
  final String description;

  TileModel(
      {required this.title,
      required this.shortDescription,
      required this.description});
}
