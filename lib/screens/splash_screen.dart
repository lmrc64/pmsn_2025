import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn_2025/screens/dashboard_screen.dart';
//import 'package:pmsn_2025/screens/list_students_screen.dart';
import 'package:pmsn_2025/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: Duration(milliseconds: 4000),
        nextScreen: FutureBuilder(
            future: _getPreferences(),
            builder: (context, snapshot) {
              return snapshot.data == true ? DashboardScreen() : LoginScreen();
            }),
        //backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset("assets/tecnm.json"),
        ),
      ),
    );
  }

  Future<bool?> _getPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? isActive = preferences.getBool('isActive');

    return isActive;
  }
}
