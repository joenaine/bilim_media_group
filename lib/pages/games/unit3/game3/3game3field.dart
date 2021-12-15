import 'package:qazlogin/pages/games/unit2/game2/question.dart';

int lengthfield = Game3Unit3Brain()._fields.length;
var indexQuestionShowed = 0;

class Game3Unit3Brain {
  final _fields = [
    QuestionFills('Біз сәулетші', 'міз'),
    QuestionFills('Біз сәулетші емес', 'піз'),
    QuestionFills('Сендер тұрғын', 'сыңдар'),
    QuestionFills('Сендер тұрғын емес', 'сіңдер'),
    QuestionFills('Сіздер зейнеткер', 'сіздер'),
    QuestionFills('Сіздер зейнеткер емес', 'сіздер'),
    QuestionFills('Олар балалар', 'лар'),
    QuestionFills('Олар балалар емес', 'тер'),
    QuestionFills('Біз мектепте', 'міз'),
    QuestionFills('Біз мектепте емес', 'піз'),
    QuestionFills('Сендер жаза', 'сыңдар'),
    QuestionFills('Сендер жазбай', 'сыңдар'),
    QuestionFills('Сіздер оқи', 'сыздар'),
    QuestionFills('Сіздер оқымай', 'сыздар'),
    QuestionFills('Олар күле', 'ді'),
    QuestionFills('Олар күлмей', 'ді'),
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
