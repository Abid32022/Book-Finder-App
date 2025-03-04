import 'package:flutter/material.dart';
import 'package:my_qurbani/views/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class LightDarkThemeScreen extends StatefulWidget {
  const LightDarkThemeScreen({super.key});

  @override
  State<LightDarkThemeScreen> createState() => _LightDarkThemeScreenState();
}

class _LightDarkThemeScreenState extends State<LightDarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider .of<ThemeChangerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Light And Dark Theme',style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [
            Container(),
            Container(),

            RadioListTile<ThemeMode>(
                title: Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme
            ),
            RadioListTile<ThemeMode>(
                title: Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme
            ),
            RadioListTile<ThemeMode>(
                title: Text('System Mode'),
                value: ThemeMode.system,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme
            )
          ],
        )
    );
  }
}

