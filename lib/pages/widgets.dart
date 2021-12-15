import 'package:flutter/material.dart';
import '../res/colors.dart';
import 'cutsom_painter.dart';
import 'middle_ring.dart';

var currentIndex = 0;
final healthTracker = ["Heart", "Eye", "Neck", "Hands", "Heart", "Eye", "Neck"];
const double pi = 3.1415926535897932;

const greenGradient = [
  Color.fromRGBO(223, 250, 92, 1),
  Color.fromRGBO(129, 250, 112, 1)
];

const turqoiseGradient = [
  Color.fromRGBO(91, 253, 199, 1),
  Color.fromRGBO(129, 182, 205, 1)
];

const redGradient = [
  Color.fromRGBO(255, 93, 91, 1),
  Color.fromRGBO(254, 154, 92, 1),
];

const orangeGradient = [
  Color.fromRGBO(251, 173, 86, 1),
  Color.fromRGBO(253, 255, 93, 1),
];

Stack customPainterProgress() => Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              //1
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(.15),
                        offset: Offset(-3, -3),
                        blurRadius: 6,
                        spreadRadius: 3),
                    BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(3, 3),
                        blurRadius: 6,
                        spreadRadius: 3),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  //2
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(-3, -3),
                          blurRadius: 3,
                        ),
                        BoxShadow(
                          color: Colors.grey[100],
                          offset: Offset(3, 3),
                          blurRadius: 3,
                        ),
                      ]),
                  child: Stack(
                    children: <Widget>[
                      Center(child: MiddleRing(width: 200.0)),
                      Transform.rotate(
                        angle: pi / 3.6,
                        child: CustomPaint(
                          child: Center(),
                          painter: ProgressRings(
                            completedPercentage: 0.28,
                            circleWidth: 30.0,
                            gradient: [
                              Colors.purpleAccent.withOpacity(0.4),
                              Colors.purpleAccent[100],
                              Colors.purple[400],
                            ],
                            gradientStartAngle: 0.0,
                            gradientEndAngle: pi / 2,
                            progressStartAngle: 1.85,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

Padding healthVerticalList() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(2, 2),
                        blurRadius: 2,
                        spreadRadius: 1),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-2, -2),
                        blurRadius: 2,
                        spreadRadius: 1),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: Icon(Icons.star_rounded),
                            ),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(-4, -4),
                                  blurRadius: 3,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(3, 3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Становитесь премиум',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'получите неограниченный\nдоступ ко всем нашим функциям!',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          border: Border.all(
                            color: Colors.purple[100],
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.arrow_forward_ios)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );

Row dateAndTimeInnerRow() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 75,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: greyShade,
                  offset: Offset(0, 4),
                  blurRadius: 16,
                  spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "14",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Пройдено",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "50",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Всего",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "5",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Уровень",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );

Padding footerRow() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          bottomMenu(Icons.home, true),
          SizedBox(
            width: 10,
          ),
          bottomMenu(Icons.account_circle, false),
          SizedBox(
            width: 10,
          ),
          bottomMenu(Icons.event_available, false),
          SizedBox(
            width: 10,
          ),
          bottomMenu(Icons.supervisor_account, false),
        ],
      ),
    );

Widget bottomMenu(IconData icon, bool onPressed) => onPressed
    ? Stack(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(3, 3),
                  blurRadius: 1,
                ),
                BoxShadow(
                    color: Colors.grey[100],
                    offset: Offset(-2, -2),
                    blurRadius: 2,
                    spreadRadius: 2),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(9.0),
                boxShadow: [
                  BoxShadow(
                    color: greyShade,
                    offset: Offset(-3, -3),
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey[100],
                    offset: Offset(2, 2),
                    blurRadius: 1,
                  ),
                ]),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          )
        ],
      )
    : Stack(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: greyShade,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2, -2),
                  blurRadius: 2,
                )
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black45,
              ),
            ),
          ),
          Positioned(
            left: 35,
            bottom: 35,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.purpleAccent[100],
                    Colors.purpleAccent,
                    Colors.purple[400],
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      );
