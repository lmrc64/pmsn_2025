import 'package:flutter/material.dart';
import 'package:pmsn_2025/screens/dashboard_screen.dart';
import 'package:pmsn_2025/screens/list_students_screen.dart';
import 'package:pmsn_2025/screens/login_screen.dart';
import 'package:pmsn_2025/screens/p1/home_screen.dart';
import 'package:pmsn_2025/screens/p1/my_orders_screen.dart';
import 'package:pmsn_2025/screens/p1/profile_screen.dart';
import 'package:pmsn_2025/screens/splash_screen.dart';
import 'package:pmsn_2025/screens/todo_screen.dart';
import 'package:pmsn_2025/utils/global_values.dart';
import 'package:pmsn_2025/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:pmsn_2025/utils/theme_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
        future: _getPreferences(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final theme = snapshot.data!['theme'];
            final font = snapshot.data!['font'];
            _changeTheme(theme, font);
          }

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
                    "/login": (context) => const LoginScreen(),
                  },
                  title: 'Material App',
                  home: SplashScreen(),
                );
              });
        });
  }

  Future<Map<String, String?>> _getPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? theme = preferences.getString('theme');
    final String? font = preferences.getString('font');

    return {
      'theme': theme,
      'font': font,
    };
  }

  _changeTheme(String? theme, String? font) {
    ThemeData themeData = ThemeData.light();
    Color color = Colors.black;

    if (theme == 'dark') {
      themeData = ThemeData.dark();
      color = Colors.grey;
    } else if (theme == 'cyber') {
      themeData = ThemeSettings.cyberTheme();
      color = Colors.grey;
    }

    GlobalValues.themeApp.value = themeData.copyWith(
      textTheme: TextTheme(
        displayLarge: TextStyle(fontFamily: font, color: color),
        displayMedium: TextStyle(fontFamily: font, color: color),
        displaySmall: TextStyle(fontFamily: font, color: color),
        headlineLarge: TextStyle(fontFamily: font, color: color),
        headlineMedium: TextStyle(fontFamily: font, color: color),
        headlineSmall: TextStyle(fontFamily: font, color: color),
        titleLarge: TextStyle(fontFamily: font, color: color),
        titleMedium: TextStyle(fontFamily: font, color: color),
        titleSmall: TextStyle(fontFamily: font, color: color),
        bodyLarge: TextStyle(fontFamily: font, color: color),
        bodyMedium: TextStyle(fontFamily: font, color: color),
        bodySmall: TextStyle(fontFamily: font, color: color),
        labelLarge: TextStyle(fontFamily: font, color: color),
        labelMedium: TextStyle(fontFamily: font, color: color),
        labelSmall: TextStyle(fontFamily: font, color: color),
      ),
    );
  }
}
