import 'game4question.dart';

int length = QuestionsBrain()._questions.length;

class QuestionsBrain {
  final _questions = [
    Game4Question('Мен мұғаліммің', false),
    Game4Question('Сен оқушысың', true),
    Game4Question('Сіз анасыз', true),
    Game4Question('Сен спортшысың', true),
    Game4Question('Сіз әншісіз', false),
    Game4Question('Мен қызбын', true),
    Game4Question('Сен аружансың', true),
    Game4Question('Сіз дәрігерсіз', false),
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
