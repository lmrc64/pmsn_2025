import 'package:flutter/material.dart';
import 'package:pmsn_2025/screens/dashboard_screen.dart';
import 'package:pmsn_2025/screens/list_students_screen.dart';
import 'package:pmsn_2025/screens/p1/home_screen.dart';
import 'package:pmsn_2025/screens/p1/my_orders_screen.dart';
import 'package:pmsn_2025/screens/p1/profile_screen.dart';
import 'package:pmsn_2025/screens/splash_screen.dart';
import 'package:pmsn_2025/screens/todo_screen.dart';
import 'package:pmsn_2025/utils/global_values.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.themeApp,
        builder: (context, value, child) {
          return MaterialApp(
            theme: value,
            routes: {
              "/list": (context) => const ListStudentsScreen(),
              "/dash": (context) => const DashboardScreen(),
              "/home": (context) => const HomeScreen(),
              "/profile": (context) => const ProfileScreen(),
              "/my_orders": (context) => const MyOrdersScreen(),
              "/todo": (context) => const TodoScreen(),
            },
            title: 'Material App',
            home: SplashScreen(),
          );
        });
  }
}
