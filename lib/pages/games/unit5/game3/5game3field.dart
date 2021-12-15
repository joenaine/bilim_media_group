import 'package:qazlogin/pages/games/unit2/game2/question.dart';

int lengthfield = Game3Unit5Brain()._fields.length;
var indexQuestionShowed = 0;

class Game3Unit5Brain {
  final _fields = [
    QuestionFills('(Арман/жатыр/істеп/жұмыс/ма/бүгін)',
        'Арман бүгін жұмыс істеп жатыр ма'),
    QuestionFills('(істеп/балалар/не/жатыр)', 'Балалар не істеп жатыр'),
    QuestionFills('(мені/тыңдап/сен/ба/отырсың)', 'Сен мені тыңдап отырсың ба'),
    QuestionFills(
        '(достарың/сенің/бара/қайда/жатыр)', 'Сенің достарың қайда бара жатыр'),
    QuestionFills('(теледидар/ата-анаңыз/отыр/ма/көріп)',
        'Ата-анаңыз теледидар көріп отыр ма'),
    QuestionFills('(Жанна/пісіріп/не/жатыр)', 'Жанна не пісіріп жатыр'),
    QuestionFills(
        '(маған/сен/отырсың/қарап/неге)', 'Сен неге маған қарап отырсың'),
    QuestionFills('(ма/келе/автобус/жатыр)', 'Автобус келе жатыр ма'),
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
