import 'package:flutter/material.dart';
import 'package:todo_flutter/app/helpers/themes/theme_data.dart';
import 'package:todo_flutter/app/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(
        title: 'HomePage',
      ),
    );
  }
}
