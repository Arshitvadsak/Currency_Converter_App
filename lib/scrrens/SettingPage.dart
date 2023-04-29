import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'en';
  void _onLanguageSelected(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Notifications'),
            subtitle: Text('Enable push notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Dark Mode'),
            subtitle: Text("Enable dark mode"),
            trailing: Icon(Icons.light),
            onTap: () {
              (Get.isDarkMode)
                  ? Get.changeThemeMode(ThemeMode.light)
                  : Get.changeThemeMode(ThemeMode.dark);
            },
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('English'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showAlertDialog();
              _selectedLanguage;
            },
          ),
          ListTile(
            title: Text('Help'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.of(context).pushNamed('theme');
              // Navigate to help page
            },
          ),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle logout action
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Language'),
          children: [
            ListTile(
              title: Text('English'),
              trailing: _selectedLanguage == 'en' ? Icon(Icons.check) : null,
              onTap: () => _onLanguageSelected('en'),
            ),
            ListTile(
              title: Text('Spanish'),
              trailing: _selectedLanguage == 'es' ? Icon(Icons.check) : null,
              onTap: () => _onLanguageSelected('es'),
            ),
            ListTile(
              title: Text('French'),
              trailing: _selectedLanguage == 'fr' ? Icon(Icons.check) : null,
              onTap: () => _onLanguageSelected('fr'),
            ),
          ],
        );
      },
    );
  }
}
