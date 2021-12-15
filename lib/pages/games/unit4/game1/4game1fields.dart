int lengthfield = Game1Unit4Brain()._fields.length;
var indexQuestionShowed = 0;

class Game1Unit4Brain {
  final _fields = [
    Question4Game1(
        'assets/pictures/unit4picture1.PNG', 'Ол алма....', 'жеп жатыр'),
    Question4Game1(
        'assets/pictures/unit4picture2.PNG', 'Ол автобус....', 'күтіп тұр'),
    Question4Game1(
        'assets/pictures/unit4picture3.PNG', 'Олар футбол....', 'ойнап жатыр'),
    Question4Game1('assets/pictures/unit4picture4.PNG',
        ' ...... еденде ........', 'Ол жатыр'),
    Question4Game1('assets/pictures/unit4picture5.PNG',
        ' ......таңғы ас ......', 'Олар ішіп отыр'),
    Question4Game1('assets/pictures/unit4picture6.PNG', '.......үстелде ......',
        'Ол күтіп отыр'),
  ];

  var _endListReached = false;

  String getFieldsPicture() {
    return _fields[indexQuestionShowed].picture;
  }

  String getFieldsTitle() {
    return _fields[indexQuestionShowed].title;
  }

  String getAnswerOfFields() {
    return _fields[indexQuestionShowed].answer;
  }

  void showNextField() {
    if (indexQuestionShowed < _fields.length - 1) {
      indexQuestionShowed++;
      _endListReached = false;
    } else {
      indexQuestionShowed = 0;
      _endListReached = true;
    }
  }

  bool checkEndOfField() {
    return _endListReached;
  }
}

class Question4Game1 {
  final String picture;
  final String title;
  final String answer;
  Question4Game1(this.picture, this.title, this.answer);
}
