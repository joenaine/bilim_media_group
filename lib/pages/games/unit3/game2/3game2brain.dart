import 'package:qazlogin/pages/games/unit1/game5/question.dart';

int length = Game2Unit3Brain()._questions.length;

class Game2Unit3Brain {
  final _questions = [
    Question('Біз ата-анамыз', true),
    Question('Сендер жақсысыздар', false),
    Question('Олар сыныптастар', true),
    Question('Сіздер әкесіңдер', false),
    Question('Біз жастарбыз', false),
    Question('Олар зейнеткер', false),
    Question('Сіздер атасыздар', true),
    Question('Сендер немерелер', false),
  ];

  var _indexQuestionShowed = 0;
  var _endListReached = false;

  String getQuestionTitle() {
    return _questions[_indexQuestionShowed].title;
  }

  bool getAnswerOfQuestion() {
    return _questions[_indexQuestionShowed].answer;
  }

  void showNextQuestion() {
    if (_indexQuestionShowed < _questions.length - 1) {
      _indexQuestionShowed++;
      _endListReached = false;
    } else {
      _indexQuestionShowed = 0;
      _endListReached = true;
    }
  }

  bool checkEndOfList() {
    return _endListReached;
  }
}
