import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning4.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '4game4field.dart';

class Game4Unit4 extends StatefulWidget {
  final Game4Unit4Brain fieldsBrain = Game4Unit4Brain();
  @override
  _Game4Unit4State createState() => _Game4Unit4State();
}

class _Game4Unit4State extends State<Game4Unit4> {
  List<TextEditingController> _controller =
      List.generate(10, (i) => TextEditingController());

  final List<Widget> score = [];
  int total = 0;

  void addOkCheck() {
    score.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void addWrongMark() {
    score.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  void checkAnswer({String buttonValue}) {
    if (buttonValue == widget.fieldsBrain.getAnswerOfFields() ||
        buttonValue == widget.fieldsBrain.getSecAnswerOfFields()) {
      addOkCheck();
      setState(() {
        total++;
      });
    } else {
      addWrongMark();
    }
    widget.fieldsBrain.showNextField();

    if (widget.fieldsBrain.checkEndOfField()) {
      showAlert();
    }
  }

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Игра завершена",
      desc: "Вы ответили на все вопросы. Хотите пройти заново?",
      buttons: [
        DialogButton(
          child: Text(
            "Да",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            setState(() {
              score.clear();
              total = 0;
            });
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "Нет",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Cleaning4(),
            ));
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: Colors.redAccent,
        )
      ],
    ).show();
  }

  Container _textField(int i) {
    return Container(
      height: 70,
      width: 300,
      child: TextField(
        controller: _controller[i],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                _controller[i].clear();
              },
              icon: Icon(Icons.cancel),
            ),
            alignLabelWithHint: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelStyle: TextStyle(fontSize: 18)),
        style: TextStyle(fontSize: 26, color: Colors.black),
      ),
    );
  }

  Widget _createCustomButton(Color color, String value, String key) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: RaisedButton(
        color: color,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          key,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.grey[300]),
        ),
        onPressed: () {
          setState(() => checkAnswer(buttonValue: value));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("$total/$lengthfield"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Center(
                child: Text(
                  widget.fieldsBrain.getFieldsTitle(),
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.indigo[700],
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          _textField(indexQuestionShowed),
          TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(
                      buttonValue: _controller[indexQuestionShowed].text);
                });
              },
              child: Text('Проверить')),
          score.length != 0
              ? Container(
                  margin: EdgeInsets.only(
                      left: 16.0, bottom: 16.0, top: 8.0, right: 16.0),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: score,
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                ),
        ],
      ),
    );
  }
}
