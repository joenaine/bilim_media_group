import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazlogin/Animation/FadeAnimation.dart';
import 'package:qazlogin/pages/selection_button.dart';
import 'package:qazlogin/pages/settings.dart';
import 'package:qazlogin/pages/upgrade_premium_card.dart';
import 'package:qazlogin/pages/widgets.dart';
import 'package:qazlogin/pages/widgets2.dart';
import 'package:qazlogin/res/colors.dart';
import 'package:qazlogin/session_cubit.dart';
import 'package:qazlogin/themes/app_constants.dart';
import 'package:qazlogin/translator/pages/home/home_page.dart';
import 'package:qazlogin/units/unit1.dart';
import 'package:qazlogin/units/unit2.dart';
import 'package:qazlogin/units/unit3.dart';
import 'package:qazlogin/units/unit4.dart';
import 'package:qazlogin/units/unit5.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String email;

  const ProfilePage({Key key, this.username, this.email}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> posts = [
    'https://cdn.dribbble.com/users/6047818/screenshots/16425364/media/a855b66a9d41c79ef04ba5dd258516ef.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/6228692/screenshots/16452651/media/f0c5644c6686695f873f94294d6e2872.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1187002/screenshots/16387491/media/15a6b53012791aeabe8debc092dbab5f.jpg?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1962534/screenshots/16431541/media/7324634fc6300cff2ef93023f04b44c2.jpg?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1615584/screenshots/16364085/media/f7a6bb29101ab59b53c72aba06f890dc.jpg?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/427857/screenshots/16434886/media/ae5f9ae8ef9dd88d9b51221d04e9b368.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/2564256/screenshots/16375491/media/895c28ea1efd9423393a85c291c94ae6.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/2564256/screenshots/16421629/media/fa97071b5dd84f924d6cda859e758648.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1126935/screenshots/16438160/media/02e1bfa43512c40bd19be76fe53391f6.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/2019344/screenshots/16425765/media/4ae7436b13d722ae28741508788ca425.png?compress=1&resize=1200x900'
  ];
  List chapters = [
    '1-тақырып',
    '2-тақырып',
    '3-тақырып',
    '4-тақырып',
    '5-тақырып',
    '6-тақырып',
    '7-тақырып',
    '8-тақырып',
    '9-тақырып',
    '10-тақырып',
    '11-тақырып',
    '12-тақырып',
    '13-тақырып',
    '14-тақырып',
    '15-тақырып',
    '16-тақырып',
    '17-тақырып',
    '18-тақырып',
    '19-тақырып',
    '20-тақырып',
  ];

  List topics = [
    'Кіріспе',
    '-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ',
    '-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ (СҰРАҚ)',
    '-МЫЗ/-МІЗ/ -СЫҢДАР/-СІҢДЕР/-СЫЗДАР/-СІЗДЕР/-ЛАР/-ЛЕР/-ДАР/-ДЕР/-ТАР/-ТЕР',
    'ІСТЕП ЖАТЫРМЫН/ІСТЕП ЖАТҚАН ЖОҚПЫН (НАҚ ОСЫ ШАҚ)',
    'ІСТЕП ЖАТЫРСЫҢ БА? (НАҚ ОСЫ ШАҚТЫҢ СҰРАУЛЫ ФОРМАСЫ)',
    '-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ (СҰРАҚ)',
    '-МЫЗ/-МІЗ/ -СЫҢДАР/-СІҢДЕР/-СЫЗДАР/-СІЗДЕР/-ЛАР/-ЛЕР/-ДАР/-ДЕР/-ТАР/-ТЕР',
    'ІСТЕП ЖАТЫРМЫН/ІСТЕП ЖАТҚАН ЖОҚПЫН (НАҚ ОСЫ ШАҚ)',
    'ІСТЕП ЖАТЫРСЫҢ БА? (НАҚ ОСЫ ШАҚТЫҢ СҰРАУЛЫ ФОРМАСЫ)',
    'Кіріспе',
    '-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ',
    '-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ (СҰРАҚ)',
    '-МЫЗ/-МІЗ/ -СЫҢДАР/-СІҢДЕР/-СЫЗДАР/-СІЗДЕР/-ЛАР/-ЛЕР/-ДАР/-ДЕР/-ТАР/-ТЕР',
    'ІСТЕП ЖАТЫРМЫН/ІСТЕП ЖАТҚАН ЖОҚПЫН (НАҚ ОСЫ ШАҚ)',
    'ІСТЕП ЖАТЫРСЫҢ БА? (НАҚ ОСЫ ШАҚТЫҢ СҰРАУЛЫ ФОРМАСЫ)',
    '-МЫН/МІН/-СЫҢ/-СІҢ/-СЫЗ/-СІЗ (СҰРАҚ)',
    '-МЫЗ/-МІЗ/ -СЫҢДАР/-СІҢДЕР/-СЫЗДАР/-СІЗДЕР/-ЛАР/-ЛЕР/-ДАР/-ДЕР/-ТАР/-ТЕР',
    'ІСТЕП ЖАТЫРМЫН/ІСТЕП ЖАТҚАН ЖОҚПЫН (НАҚ ОСЫ ШАҚ)',
    'ІСТЕП ЖАТЫРСЫҢ БА? (НАҚ ОСЫ ШАҚТЫҢ СҰРАУЛЫ ФОРМАСЫ)'
  ];

  List<ImageProvider> getMember() {
    return const [
      AssetImage(ImageRasterPath.avatar1),
      AssetImage(ImageRasterPath.avatar2),
      AssetImage(ImageRasterPath.avatar3),
      AssetImage(ImageRasterPath.avatar4),
      AssetImage(ImageRasterPath.avatar5),
      AssetImage(ImageRasterPath.avatar6),
    ];
  }

  List<Widget> route = [Unit1(), Unit2(), Unit3(), Unit4(), Unit5()];

  Padding daysAndTimeBox() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: greyShade,
                    offset: Offset(4, 4),
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(.2),
                    offset: Offset(-2, -2),
                    blurRadius: 0,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 13,
              left: 13,
              right: 10,
              bottom: 10,
              child: Container(
                width: 110,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: greyShade,
                      offset: Offset(-3, -3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: dateAndTimeInnerRow(),
              ),
            ),
          ],
        ),
      );
  bool run = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
          child: Container(
        color: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(kSpacing),
              ),
              const Divider(thickness: 1),
              SelectionButton(
                data: [
                  SelectionButtonData(
                    activeIcon: EvaIcons.grid,
                    icon: EvaIcons.gridOutline,
                    label: "Главная страница",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.archive,
                    icon: EvaIcons.archiveOutline,
                    label: "Обратная связь",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.email,
                    icon: EvaIcons.emailOutline,
                    label: "Email",
                    totalNotif: 20,
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.settings,
                    icon: EvaIcons.settingsOutline,
                    label: "Настройки",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.logOut,
                    icon: EvaIcons.logOut,
                    label: "Выйти",
                  ),
                ],
                onSelected: (index, value) {},
              ),
              const Divider(thickness: 1),
              const SizedBox(height: kSpacing * 2),
              UpgradePremiumCard(
                backgroundColor: Theme.of(context).canvasColor.withOpacity(.4),
                onPressed: () {},
              ),
              const SizedBox(height: kSpacing),
            ],
          ),
        ),
      )),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildHeader(onPressedMenu: () {
                        Scaffold.of(context).openDrawer();
                      }),
                      const SizedBox(height: kSpacing / 2),
                      const Divider(),
                      buildProfile(
                          username: widget.username, email: widget.email),
                      const SizedBox(height: kSpacing),
                      buildProgress(),
                      const SizedBox(height: kSpacing),
                      buildTeamMember(data: getMember()),
                      const SizedBox(height: kSpacing),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kSpacing),
                        child: GetPremiumCard(onPressed: () {}),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: DefaultTabController(
          length: 2,
          child: Column(children: [
            FadeAnimation(
                2.2,
                Container(
                    child: TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        tabs: [
                      Tab(
                        child: Text('Все'),
                      ),
                      Tab(
                        child: Text('Избранное'),
                      ),
                    ]))),
            Expanded(
                child: FadeAnimation(
                    2.2,
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: TabBarView(children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: chapters.length,
                            itemBuilder: (context, index) {
                              return OpenContainer(
                                transitionDuration: Duration(milliseconds: 500),
                                openBuilder: (context, closeWidget) =>
                                    route[index],
                                closedBuilder: (context, openWidget) =>
                                    GestureDetector(
                                  onTap: openWidget,
                                  child: Card(
                                    child: ListTile(
                                      leading: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 10),
                                        child: CircularPercentIndicator(
                                          radius: 36,
                                          lineWidth: 3,
                                          backgroundColor: Colors.white,
                                          percent: 0.7,
                                          progressColor:
                                              Theme.of(context).primaryColor,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          animation: true,
                                          center: Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        chapters[index]
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      subtitle: Text(
                                        topics[index],
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        size: 18,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          ),
                          GridView.builder(
                              itemCount: posts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 0,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 1.2),
                              itemBuilder: (context, index) {
                                return post(
                                    (1.0 + index) / 4, posts[index], 'grid');
                              })
                        ]))))
          ]),
        ),
      ),
    );
  }

  post(delay, image, type) {
    return FadeAnimation(
        delay,
        Container(
          margin: type == 'grid' ? EdgeInsets.all(0) : EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(image),
          ),
        ));
  }

  Padding measureHealthHorizontalList() => Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          height: 250,
          child: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                child: Container(
                  width: 190,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-2, -2),
                          blurRadius: 3,
                          spreadRadius: 2),
                      BoxShadow(
                          color: greyShade,
                          offset: Offset(2, 2),
                          blurRadius: 3,
                          spreadRadius: 2),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Уровень Прохождения',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                r'5 уровень',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
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
                                  child: Text(
                                    r'5.85',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: double.infinity,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white30,
                                        offset: Offset(3, 3),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Colors.white30,
                                        offset: Offset(-3, -3),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: double.infinity,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[400],
                                        offset: Offset(-3, -3),
                                        blurRadius: 3,
                                        //spreadRadius: 3,
                                      ),
                                      BoxShadow(
                                        color: Colors.grey[100],
                                        offset: Offset(3, 3),
                                        blurRadius: 3,
                                        // spreadRadius: 3,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 28,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.purpleAccent.withOpacity(0.4),
                                        Colors.purpleAccent[100],
                                        Colors.purple[400],
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
