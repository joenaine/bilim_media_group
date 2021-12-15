import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'itemModel.dart';

class Game2 extends StatefulWidget {
  @override
  _Game2State createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  List<ItemModel> items;
  List<ItemModel> items2;
  int length;

  int score;
  bool gameOver;
  bool isPressedValue = false;
  bool isPressedName = false;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(value: 'Мен бала', name: '–мын'),
      ItemModel(value: 'Сен әке', name: '-сің'),
      ItemModel(value: 'Ол ұл', name: '-'),
      ItemModel(value: 'Сіз дәрігер', name: '-сіз'),
      ItemModel(value: 'Сен спортшы', name: '-сың'),
      ItemModel(value: 'Ол әнші', name: '-'),
      ItemModel(value: 'Сіз ата', name: '-сыз'),
      ItemModel(value: 'Мен қыз', name: '-бын'),
      ItemModel(value: 'Мен жігіт', name: '-пін'),
      ItemModel(value: 'Мен ана', name: '-мын'),
      ItemModel(value: 'Мен әже', name: '-мін'),
      ItemModel(value: 'Мен Айдос', name: '-пын'),
      ItemModel(value: 'Мен Ғазиз', name: '–бын'),
      ItemModel(value: 'Мен мұғалім', name: '–мін'),
      ItemModel(value: 'Сен аға', name: '-сың'),
    ];
    items2 = List<ItemModel>.from(items);
    length = items.length;
    items2.shuffle();
  }

  String first;
  String second;

  @override
  void initState() {
    super.initState();
    initGame();
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
              initGame();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('$score / $length'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: score == length
              ? Center(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          initGame();
                        });
                      },
                      child: Text('Пройти заново')),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: items
                          .asMap()
                          .map((i, item) => MapEntry(
                              i,
                              ElevatedButton(
                                  onPressed: () {
                                    print(i);
                                    setState(() {
                                      first = item.value;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan),
                                  child: Text(item.value))))
                          .values
                          .toList(),
                    ),
                    Column(
                      children: items2
                          .asMap()
                          .map((i, item) => MapEntry(
                              i,
                              ElevatedButton(
                                  onPressed: () {
                                    print(i);
                                    setState(() {
                                      second = item.value;
                                      if (first == second) {
                                        items.remove(item);
                                        items2.remove(item);
                                        score++;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent),
                                  child: Text(item.name))))
                          .values
                          .toList(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
