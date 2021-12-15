int lengthadd = AddBrain()._fields.length;
var indexQuestionShowed = 0;

class AddBrain {
  final _fields = [
    QuestionFills('-Сенің ата-анаң ... \n\n -Шүкір, жақсы', 'қалай?'),
    QuestionFills('-Сөмкем ....? \n\n -Үстелде', 'қайда?'),
    QuestionFills('-Сіздің ...... балаңыз бар? \n\n -Бес', 'қанша?'),
    QuestionFills('-Мына алма .... тұрады? \n\n -Бір келісі 450 тг', 'қанша?'),
    QuestionFills('-Сенің сүйікті спортың ....? \n\n -Шаңғы тебу', 'қандай?'),
    QuestionFills('-Бұл фотограф кісі ...?\n\n -Менің әкем', 'кім?'),
    QuestionFills('-Сенің жаңа аяқ киіміңнің түсі ....?\n\n -Қара', 'қандай?'),
  ];

  var _endListReached = false;

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

class QuestionFills {
  final String title;
  final String answer;
  QuestionFills(this.title, this.answer);
}
