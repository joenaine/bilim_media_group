import 'package:qazlogin/pages/games/unit2/game2/question.dart';

int lengthfield = Game3Unit4Brain()._fields.length;
var indexQuestionShowed = 0;

class Game3Unit4Brain {
  final _fields = [
    QuestionFills('(түскі ас ішу) Айғаным....', 'түскі ас ішіп жатқан жоқ'),
    QuestionFills('(теледидар көру) Ол....', 'теледидар көріп жатыр'),
    QuestionFills('(еденде отыру) Ол....', 'еденде отыр'),
    QuestionFills('(кітап оқу)', 'кітап оқып жатқан жоқ'),
    QuestionFills('(пианинода ойнау)', 'пианинода ойнап жатқан жоқ'),
    QuestionFills('(күлу)', 'күліп отыр'),
    QuestionFills('(бас киім кию)', 'бас киім киіп отыр'),
    QuestionFills('(хат жазу)', 'хат жазып жатқан жоқ'),
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
