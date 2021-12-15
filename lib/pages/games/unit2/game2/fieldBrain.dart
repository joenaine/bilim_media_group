import 'question.dart';

int lengthfield = FieldsBrain()._fields.length;
var indexQuestionShowed = 0;

class FieldsBrain {
  final _fields = [
    QuestionFills('(ме /сенің анаң / үйде) ', 'Сенің анаң үйде ме'),
    QuestionFills('(жақсы / ата-анаң / сенің / ма?', 'Сенің ата-анаң жақсы ма'),
    QuestionFills(
        '(жұмысыңыз / қызықты / ма / сіздің)', 'Сіздің жұмысыңыз қызықты ма'),
    QuestionFills('(па / ашық / бүгін / дүкен)', 'Дүкен бүгін ашық па'),
    QuestionFills('(тұрасың / қайда / сен) ', 'Сен қайда тұрасың'),
    QuestionFills(
        '(спортқа / сіз / қызығасыз / ба)', 'Сіз спортқа қызығасыз ба'),
    QuestionFills(
        '(жақын / мектеп / ба / бұл жерге)', 'Мектеп бұл жерге жақын ба'),
    QuestionFills('(мектепте / оқушылар / ме)', 'Оқушылар мектепте ме'),
    QuestionFills(' (кешіктің / сен / неге) ', 'Сен неге кешіктің'),
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
