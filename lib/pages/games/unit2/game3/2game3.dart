import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning2.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

import 'addBrain.dart';

class Game3Unit2 extends StatefulWidget {
  final AddBrain fieldsBrain = AddBrain();
  @override
  _Game3Unit2State createState() => _Game3Unit2State();
}

class _Game3Unit2State extends State<Game3Unit2> {
  TextEditingController _editingController = new TextEditingController();
  bool isFocused = false;
  FocusNode _focusNode = new FocusNode();

  List<String> _feedbacks = [
    'қалай?',
    'қайда?',
    'қанша?',
    'не?',
    'кім?',
    'қандай?',
  ];

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
    if (buttonValue == widget.fieldsBrain.getAnswerOfFields()) {
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
              builder: (context) => Cleaning2(),
            ));
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: Colors.redAccent,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("$total/$lengthadd"),
      ),
      body: Column(
        children: [
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
          SizedBox(
            width: 300,
            child: TextField(
              enabled: false,
              maxLines: 1,
              focusNode: _focusNode,
              controller: _editingController,
              cursorColor: Colors.black,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 1),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 8.0,
              children: _feedbacks
                  .asMap()
                  .map((i, item) => MapEntry(
                        i,
                        BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            _editingController.text = _feedbacks[i];
                            _focusNode.requestFocus();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 2),
                            ),
                            child: Text(
                              _feedbacks[i],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 16),
                            ),
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(buttonValue: _editingController.text);
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
