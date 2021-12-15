import 'game3models.dart';

int lengthfield = FieldsBrain()._fields.length;
var indexQuestionShowed = 0;

class FieldsBrain {
  final _fields = [
    Game4QuestionFills('Сен оқушы____', 'емессің'),
    Game4QuestionFills('Сіз дәрігер ____', 'емессіз'),
    Game4QuestionFills('Мен студент ____', 'емеспін'),
    Game4QuestionFills('Ол бесте ____', 'емес'),
    Game4QuestionFills('Сен қалада ____', 'емессің'),
    Game4QuestionFills('Сіз Алматыда ____', 'емессіз'),
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
