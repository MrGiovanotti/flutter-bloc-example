import 'package:bloc_example/screens/add_user_screen.dart';
import 'package:bloc_example/screens/home_screen.dart';
import 'package:bloc_example/utils/routes_utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bloc_example',
      initialRoute: RoutesUtils.HOME,
      routes: {
        RoutesUtils.HOME: (context) => HomeScreen(),
        RoutesUtils.ADD_USER: (context) => AddUserScreen(),
      },
    );
  }
}
