import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'questionsBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Game5 extends StatefulWidget {
  final QuestionsBrain questionsBrain = QuestionsBrain();
  @override
  _Game5State createState() => _Game5State();
}

class _Game5State extends State<Game5> {
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

  void checkAnswer(bool buttonValue) {
    if (buttonValue == widget.questionsBrain.getAnswerOfQuestion()) {
      addOkCheck();
      setState(() {
        total++;
      });
    } else {
      addWrongMark();
    }
    widget.questionsBrain.showNextQuestion();

    if (widget.questionsBrain.checkEndOfList()) {
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
              builder: (context) => CleaningPage(),
            ));
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: Colors.redAccent,
        )
      ],
    ).show();
  }

  Widget _createCustomButton(Color color, bool value, String key) {
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
          setState(() => checkAnswer(value));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("$total/$length"),
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
                  widget.questionsBrain.getQuestionTitle(),
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.indigo[700],
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          _createCustomButton(Colors.green, true, 'Дұрыс'),
          _createCustomButton(Colors.redAccent, false, 'Бұрыс'),
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
