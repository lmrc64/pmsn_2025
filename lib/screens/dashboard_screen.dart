import 'dart:io';

import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn_2025/utils/global_values.dart';
import 'package:pmsn_2025/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? username;
  String? email;
  String? userImage;

  @override
  void initState() {
    super.initState();
    _getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        actions: [
          DarlightButton(
            type: Darlights.DarlightFour,
            options: DarlightFourOption(),
            onChange: (value) {
              if (value == ThemeMode.light) {
                GlobalValues.themeApp.value = ThemeSettings.lightTheme();
              } else {
                GlobalValues.themeApp.value = ThemeSettings.darkTheme();
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: userImage == null
                    ? NetworkImage('https://i.pravatar.cc/300')
                    : FileImage(File(userImage!)),
              ),
              accountName: username == null
                  ? Text(
                      "Rubensin",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : Text(
                      username!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
              accountEmail: email == null
                  ? Text(
                      "21030064@itcelaya.edu.mx",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : Text(
                      email!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.setBool('isActive', false);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (Route route) => false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
              leading: Icon(Icons.design_services),
              title: Text('Practica Figma'),
              subtitle: Text('Frontend Page'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/todo");
              },
              leading: Icon(Icons.task),
              title: Text('Todo App'),
              subtitle: Text('Task List'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                _themeAndFont(context);
              },
              leading: Icon(Icons.font_download),
              title: Text('Themes and Fonts'),
              subtitle: Text('SharedPreferences && User Register'),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
      //endDrawer: Drawer(),
    );
  }

  Future<void> _getPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? username = preferences.getString('username');
    final String? email = preferences.getString('email');
    final String? userImage = preferences.getString('userImage');

    setState(() {
      this.username = username;
      this.email = email;
      this.userImage = userImage;
    });
  }

  Future<void> _themeAndFont(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Themes And Fonts')),
          content: Container(
            height: 350,
            width: 300,
            child: Column(
              children: [
                Text(
                  "Select Your Theme",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setString('theme', 'light');
                        final String? font = preferences.getString('font');
                        _changeTheme(ThemeData.light(), font, Colors.black);

                        //GlobalValues.themeApp.value = ThemeData.light();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.sunny,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setString('theme', 'dark');
                        final String? font = preferences.getString('font');
                        _changeTheme(ThemeData.dark(), font, Colors.grey);
                        //GlobalValues.themeApp.value = ThemeData.dark();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.nightlight,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setString('theme', 'cyber');
                        final String? font = preferences.getString('font');
                        _changeTheme(
                            ThemeSettings.cyberTheme(), font, Colors.grey);
                        //GlobalValues.themeApp.value = ThemeSettings.cyberTheme();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.computer,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Select Your Font',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButton<String>(
                  hint: Text('Font'),
                  items: ['Sen', 'CyberBrush', 'Bats'].map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? font) async {
                    if (font != null) {
                      final SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.setString('font', font);
                      String? theme = preferences.getString('theme');

                      Color color =
                          theme == 'light' ? Colors.black : Colors.grey;

                      _changeTheme(GlobalValues.themeApp.value, font, color);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> _getFont() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? font = preferences.getString('font');

    return font;
  }

  _changeTheme(ThemeData theme, String? font, Color color) {
    GlobalValues.themeApp.value = theme.copyWith(
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
