import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:hive_flutter/hive_flutter.dart';

import './providers/my_provider.dart';
import './screens/home_screen.dart';
import './models/tile_model.dart';

void main() async {
  //initialize hive database
  await Hive.initFlutter();

  Hive.registerAdapter(TileModelAdapter());

  //open the box in hive database
  await Hive.openBox<List>('myBox');

  runApp(
    provider.ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
