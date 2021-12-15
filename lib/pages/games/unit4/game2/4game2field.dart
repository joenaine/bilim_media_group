import 'package:qazlogin/pages/games/unit2/game2/question.dart';

int lengthfield = Game2Unit4Brain()._fields.length;
var indexQuestionShowed = 0;

class Game2Unit4Brain {
  final _fields = [
    QuestionFills('Тыныштық сақтаңызшы. Мен.....', 'жұмыс істеп отырмын'),
    QuestionFills('«Айдар қайда?» «Айдар асүйде. Ол ......».', 'пісіріп жатыр'),
    QuestionFills(
        ' «Мен жаяу .........». «Кешірім өтінемін!»', 'келе жатырмын'),
    QuestionFills(' Қараңыз! Өзенде біреу ............', 'шомылып жатыр'),
    QuestionFills(
        'Біз демалыстамыз. Біз орталық қонақүйде ........', 'тұрып жатырмыз'),
    QuestionFills(
        '«Айдана қайда?» «Айдана суға ............»', 'шомылып жатыр'),
    QuestionFills(
        'Олар қазір қала орталығынан жаңа қонақүй ........', 'салып жатыр'),
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
