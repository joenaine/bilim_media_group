import 'package:qazlogin/pages/games/unit2/game2/question.dart';

int lengthgame4 = FieldsBrain()._fields.length;
var indexQuestionShowed = 0;

class FieldsBrain {
  final _fields = [
    QuestionFills('- (аты?) \n\n - Әсет ', 'Сенің атың кім'),
    QuestionFills('- (Ресей?) \n\n - Жоқ, ол Канададан', 'Ол Ресейден бе'),
    QuestionFills('- (жасы?) \n\n - 30', 'Сіздің жасыңыз қаншада'),
    QuestionFills(
        '- (мұғалім?) \n\n - Жоқ, мен заңгермін', 'Сіз мұғалімсіз бе'),
    QuestionFills('- (үйленген?) \n\n - Ия, үйленгенмін', 'Сіз үйленгенсіз бе'),
    QuestionFills(
        '- (әйелің заңгер?) \n\n - Жоқ, ол дизайнер', 'Сенің әйелің заңгер ме'),
    QuestionFills('- (оның аты?) \n\n - Оның аты – Анар', 'Оның аты кім'),
    QuestionFills('- (жасы?) \n\n - Ол 27 жаста', 'Оның жасы қаншада'),
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
