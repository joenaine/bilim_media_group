import 'package:flutter/material.dart';
import 'package:qazlogin/translator/components/choose_language.dart';
import 'package:qazlogin/translator/components/input_text.dart';
import 'package:qazlogin/translator/components/translate_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChooseLanguage(),
            InputText(),
            TranslateText(),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Переводчик',
      style: TextStyle(),
    ),
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0.0,
  );
}
