import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazlogin/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:qazlogin/auth/auth_repository.dart';
import 'package:qazlogin/auth/login/login_view.dart';
import 'package:qazlogin/session_cubit.dart';

class SettingsPage extends StatefulWidget {
  final String username;

  const SettingsPage({Key key, this.username}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<List> _settings = [
    [
      'Уведомления',
      'Вкл/выкл уведомления',
      Icons.notifications_rounded,
      Colors.red[400]
    ],
    ['Помощь', 'Помощь и Обратная связь', Icons.help_outline, Colors.blue[400]],
    ['Выйти', 'Выйти', Icons.exit_to_app, Colors.black],
  ];

  int activeStatus = 0;

  showLogoutDealog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Выйти'),
            content: Text('Вы действительно хотите выйти из аккаунта?'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Закрыть',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Выйти'),
                onPressed: () {
                  AuthRepository().signOut();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Настройки',
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Аккаунт',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _settings.length,
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                        (1.0 + index) / 4,
                        settingsOption(_settings[index][0], _settings[index][1],
                            _settings[index][2], _settings[index][3]));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  settingsOption(String title, String subtitle, IconData icon, Color color) {
    return ListTile(
      onTap: () {
        if (title == 'Выйти') {
          showLogoutDealog();
        }
      },
      subtitle: Text(subtitle),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey.shade400,
      ),
    );
  }
}
