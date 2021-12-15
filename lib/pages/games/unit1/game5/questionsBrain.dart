import 'question.dart';

int length = QuestionsBrain()._questions.length;

class QuestionsBrain {
  final _questions = [
    Question('Мен Айдарбын', false),
    Question('Сен Астанадасың', true),
    Question('Ол Даниярмын', false),
    Question('Сіз Алматыдасың', false),
    Question('Мен оқушымын емеспін', false),
    Question('Сен дәрігер емессің', true),
    Question('Сіз мұғалімсіз емес', false),
    Question('Ол спортшы емес', true),
    Question('Сен үйдесің', true),
    Question('Мен даладамын', true),
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
