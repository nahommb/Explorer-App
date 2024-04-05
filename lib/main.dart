import 'package:explorer_app/providers/great_places.dart';
import 'package:explorer_app/screens/places_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<GreatePlaces>(create: (ctx)=>GreatePlaces()),

      ],
      child: MaterialApp(
        title: 'Greate Places',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: PlaceListScreen(),
      ),
    );
  }
}
