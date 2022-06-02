import 'package:flutter/material.dart';

import 'screens/user/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDEA Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.white,onSurface: Colors.black,onPrimary: Colors.black,textStyle: TextStyle(color: Colors.black))),
        textTheme: TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme:
            InputDecorationTheme(border: OutlineInputBorder()),
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 3),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.black.withOpacity(0.6)),
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}
