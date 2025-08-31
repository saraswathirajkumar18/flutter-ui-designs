import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //display title in desktop,web app
      //when minimize the app it appears in top of the app-mobile app
      title: 'Flutter Design',
      //remove the debug banner appear on top right of the app.otherwise it hide some design in page
      debugShowCheckedModeBanner: false,
      //if color is not mentioned for app then this value is set as default value
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //by default flutter only supports material2.
        //to enable material3 set as true.material3-
        //supports applies the new styles, shapes, and colors for widgets like AppBar, ElevatedButton, FAB, Card, etc.
        useMaterial3: true,
      ),
      //main screen of the app
      home:HomePage()
      );
  }
}