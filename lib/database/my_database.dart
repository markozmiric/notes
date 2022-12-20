import 'package:hive_flutter/hive_flutter.dart';

class MyDatabase {
  final _myBox = Hive.box<List>('myBox');

  void updateDatabase(List myData) {
    _myBox.put('myData', myData);
  }

  List getDataFromDatabase() {
    return (_myBox.get('myData') == null) ? [] : _myBox.get('myData') as List;
  }
}
