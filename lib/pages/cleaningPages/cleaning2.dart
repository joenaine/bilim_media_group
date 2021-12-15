import 'package:flutter/material.dart';
import 'package:qazlogin/Animation/FadeAnimation.dart';
import 'package:qazlogin/pages/games/unit2/game1/2game1.dart';
import 'package:qazlogin/pages/games/unit2/game2/2game2.dart';
import 'package:qazlogin/pages/games/unit2/game3/2game3.dart';
import 'package:qazlogin/pages/games/unit2/game4/2game4.dart';
import 'package:qazlogin/pages/profile.dart';
import 'package:qazlogin/pages/profile1.dart';

class Cleaning2 extends StatefulWidget {
  @override
  _Cleaning2State createState() => _Cleaning2State();
}

class _Cleaning2State extends State<Cleaning2> {
  // Rooms to clean
  List<dynamic> _rooms = [
    [
      'Сұрақтың дұрыс жауабын табыңыз',
      'https://img.icons8.com/color/48/000000/hand-drag.png',
      Colors.red,
      0
    ],
    [
      'Сөздерден сөйлем құраңыз',
      'https://img.icons8.com/color/48/000000/abc.png',
      Colors.orange,
      1
    ],
    [
      'Сұрақты толықтырыңыз',
      'https://img.icons8.com/color/50/000000/1.png',
      Colors.blue,
      1
    ],
    [
      'Сұраулы сөйлем жасап жазыңыз',
      'https://img.icons8.com/color/50/000000/ball-point-pen.png',
      Colors.purple,
      0
    ],
  ];

  List<Widget> route = [Game1Unit2(), Game2Unit2(), Game3Unit2(), Game4Unit2()];

  List<int> _selectedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _selectedRooms.length > 0
            ? FloatingActionButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage1(),
                        ));
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_selectedRooms.length}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
                backgroundColor: Colors.blue,
              )
            : FloatingActionButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage1(),
                        ));
                  });
                },
                child: Icon(Icons.home),
              ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Жаттығулар',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _rooms.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                      (1.2 + index) / 4, room(_rooms[index], index));
                }),
          ),
        ));
  }

  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route[index],
            ));
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else
            _selectedRooms.add(index);
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _selectedRooms.contains(index)
                ? room[2].shade50.withOpacity(0.5)
                : Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.network(
                        room[1],
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        room[0],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  _selectedRooms.contains(index)
                      ? Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 20,
                          ))
                      : SizedBox()
                ],
              ),
            ],
          )),
    );
  }
}
