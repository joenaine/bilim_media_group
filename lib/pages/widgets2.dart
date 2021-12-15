import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qazlogin/pages/progress_report_card.dart';
import 'package:qazlogin/pages/selection_button.dart';
import 'package:qazlogin/pages/upgrade_premium_card.dart';
import 'package:qazlogin/session_cubit.dart';
import 'package:qazlogin/themes/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazlogin/translator/pages/home/home_page.dart';
import 'package:intl/intl.dart';

Widget buildProfile({String username, String email}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: ProfilTile(
      username: username,
      email: email,
    ),
  );
}

Drawer openDrawer() {
  return Drawer(
      child: Container(
          color: Colors.deepPurple[300],
          child: ListView(children: [
            DrawerHeader(
                child: Center(
              child: Text(
                'Н А В И Г А Ц И Я',
                style: TextStyle(fontSize: 30),
              ),
            )),
            ListTile(
              title: Text(
                'Система дыхания',
                style: TextStyle(fontSize: 20),
              ),
            )
          ])));
}

Widget buildHeader({Function() onPressedMenu}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: Row(
      children: [
        if (onPressedMenu != null)
          Padding(
            padding: const EdgeInsets.only(right: kSpacing),
            child: IconButton(
              onPressed: onPressedMenu,
              icon: const Icon(EvaIcons.menu),
              tooltip: "menu",
            ),
          ),
        const Expanded(child: Header()),
      ],
    ),
  );
}

class ProfilTile extends StatelessWidget {
  const ProfilTile({this.username, this.email, Key key}) : super(key: key);

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        username,
        style: TextStyle(fontSize: 16, color: kFontColorPallets[0]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        email,
        style: TextStyle(fontSize: 14, color: kFontColorPallets[2]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: () {
          BlocProvider.of<SessionCubit>(context).signOut();
        },
        icon: const Icon(EvaIcons.logOutOutline),
        tooltip: "notification",
      ),
    );
  }
}

class _Profile {
  final String name;

  const _Profile({
    @required this.name,
  });
}

class ProgressCardData {
  final int totalUndone;
  final int totalTaskInProress;

  const ProgressCardData({
    @required this.totalUndone,
    @required this.totalTaskInProress,
  });
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    @required this.data,
    @required this.onPressedCheck,
    Key key,
  }) : super(key: key);

  final ProgressCardData data;
  final Function() onPressedCheck;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(10, 30),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset(
                    ImageVectorPath.happy2,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kSpacing,
              top: kSpacing,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Переводчик",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "русско-казахский и казахско-русский",
                  style: TextStyle(color: kFontColorPallets[1]),
                ),
                const SizedBox(height: kSpacing),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                  child: const Text("Перейти"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildProgress({Axis axis = Axis.vertical}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: (axis == Axis.horizontal)
        ? Row(
            children: [
              Flexible(
                flex: 5,
                child: ProgressCard(
                  data: const ProgressCardData(
                    totalUndone: 10,
                    totalTaskInProress: 2,
                  ),
                  onPressedCheck: () {},
                ),
              ),
              const SizedBox(width: kSpacing / 2),
              const Flexible(
                flex: 4,
                child: ProgressReportCard(
                  data: ProgressReportCardData(
                    title: "1st Sprint",
                    doneTask: 5,
                    percent: .3,
                    task: 3,
                    undoneTask: 2,
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              ProgressCard(
                data: const ProgressCardData(
                  totalUndone: 10,
                  totalTaskInProress: 2,
                ),
                onPressedCheck: () {},
              ),
              const SizedBox(height: kSpacing / 2),
              const ProgressReportCard(
                data: ProgressReportCardData(
                  title: "Прогресс",
                  doneTask: 5,
                  percent: .3,
                  task: 3,
                  undoneTask: 2,
                ),
              ),
            ],
          ),
  );
}

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TodayText(),
        const SizedBox(width: kSpacing),
        Expanded(child: SearchField()),
      ],
    );
  }
}

class TodayText extends StatelessWidget {
  const TodayText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Сегодня",
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            DateFormat('dd-MM-yyyy').format(DateTime.now()),
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  SearchField({this.onSearch, Key key}) : super(key: key);

  final controller = TextEditingController();
  final Function(String value) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabled: false,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Bilim Media Club",
        isDense: true,
        fillColor: Theme.of(context).cardColor,
      ),
      style: TextStyle(color: kFontColorPallets[1]),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({
    this.data,
    Key key,
  }) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: ProjectCard(
                data: data,
              ),
            ),
            const Divider(thickness: 1),
            SelectionButton(
              data: [
                SelectionButtonData(
                  activeIcon: EvaIcons.grid,
                  icon: EvaIcons.gridOutline,
                  label: "Dashboard",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.archive,
                  icon: EvaIcons.archiveOutline,
                  label: "Reports",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.calendar,
                  icon: EvaIcons.calendarOutline,
                  label: "Calendar",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.email,
                  icon: EvaIcons.emailOutline,
                  label: "Email",
                  totalNotif: 20,
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.person,
                  icon: EvaIcons.personOutline,
                  label: "Profil",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.settings,
                  icon: EvaIcons.settingsOutline,
                  label: "Setting",
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
    );
  }
}

class ProjectCardData {
  final double percent;
  final ImageProvider projectImage;
  final String projectName;
  final DateTime releaseTime;

  const ProjectCardData({
    @required this.projectImage,
    @required this.projectName,
    @required this.releaseTime,
    @required this.percent,
  });
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    this.data,
    Key key,
  }) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ProgressIndicator(
          percent: data.percent,
          center: _ProfilImage(image: data.projectImage),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleText(data.projectName),
              const SizedBox(height: 5),
              Row(
                children: [
                  const _SubtitleText("Release time : "),
                  _ReleaseTimeText(data.releaseTime)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

/* -----------------------------> COMPONENTS <------------------------------ */
class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    @required this.percent,
    @required this.center,
    Key key,
  }) : super(key: key);

  final double percent;
  final Widget center;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 55,
      lineWidth: 2.0,
      percent: percent,
      center: center,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.blueGrey,
      progressColor: Color.fromRGBO(128, 109, 255, 1),
    );
  }
}

class _ProfilImage extends StatelessWidget {
  const _ProfilImage({@required this.image, Key key}) : super(key: key);

  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: image,
      radius: 20,
      backgroundColor: Colors.white,
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: kFontColorPallets[0],
        letterSpacing: 0.8,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText(this.data, {Key key}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: 11, color: kFontColorPallets[2]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ReleaseTimeText extends StatelessWidget {
  const _ReleaseTimeText(this.date, {Key key}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kNotifColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Text(
        DateFormat.yMMMd().format(date),
        style: const TextStyle(fontSize: 9, color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

Widget buildTeamMember({@required List<ImageProvider> data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: kSpacing / 2),
        ListProfilImage(maxImages: 6, images: data),
      ],
    ),
  );
}

class ListProfilImage extends StatelessWidget {
  const ListProfilImage({
    @required this.images,
    this.onPressed,
    this.maxImages = 3,
    Key key,
  }) : super(key: key);

  final List<ImageProvider> images;

  final Function() onPressed;
  final int maxImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: _getLimitImage(images, maxImages)
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(right: (e.key * 25.0)),
              child: _image(
                e.value,
                onPressed: onPressed,
              ),
            ),
          )
          .toList(),
    );
  }

  List<ImageProvider> _getLimitImage(List<ImageProvider> images, int limit) {
    if (images.length <= limit) {
      return images;
    } else {
      List<ImageProvider> result = [];
      for (int i = 0; i < limit; i++) {
        result.add(images[i]);
      }
      return result;
    }
  }

  Widget _image(ImageProvider image, {Function() onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(38, 40, 55, 1),
        ),
        child: CircleAvatar(
          backgroundImage: image,
          radius: 15,
        ),
      ),
    );
  }
}

class GetPremiumCard extends StatelessWidget {
  const GetPremiumCard({
    @required this.onPressed,
    this.backgroundColor,
    Key key,
  }) : super(key: key);

  final Color backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(kBorderRadius),
      color: backgroundColor ?? Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        onTap: onPressed,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 250,
            maxWidth: 350,
            minHeight: 200,
            maxHeight: 200,
          ),
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  ImageVectorPath.wavyBus,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: _Info(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Получить\nПремиум\nАккаунт",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Для доступа к другим главам",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
