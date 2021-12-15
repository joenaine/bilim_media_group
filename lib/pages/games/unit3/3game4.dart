import 'package:flutter/material.dart';
import 'package:qazlogin/pages/games/unit2/game1/itemModel.dart';

class Game4Unit3 extends StatefulWidget {
  @override
  _Game4Unit3State createState() => _Game4Unit3State();
}

class _Game4Unit3State extends State<Game4Unit3> {
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
      ItemModel(value: 'Біз', name: ' мұғалімбіз'),
      ItemModel(value: 'Сендер', name: ' отыз бестесіңдер'),
      ItemModel(value: 'Сіздер', name: 'дұрыс емессіздер'),
      ItemModel(value: 'Олар', name: ' оқушылар емес'),
      ItemModel(value: 'Сендер', name: 'ғалым емессіңдер'),
      ItemModel(value: 'Біз', name: ' дәрігер емеспіз'),
      ItemModel(value: 'Олар', name: 'ауылда емес'),
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
