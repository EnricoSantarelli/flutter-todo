import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';
import 'package:todo_flutter/app/helpers/themes/theme_data.dart';
import 'package:todo_flutter/app/views/pages/dashboard_page.dart';
import 'package:todo_flutter/app/views/pages/home_page.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => TasksStore(),
        child: MaterialApp(
          title: 'To Do List',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/dashboard': (context) => const DashboardPage()
          },
        ));
  }
}
