int lengthfield = Game1Unit5Brain()._fields.length;
var indexQuestionShowed = 0;

class Game1Unit5Brain {
  final _fields = [
    Question5Game1(
        'assets/pictures/unit5picture1.PNG', 'Сен теледидар қарап жатырсың ба'),
    Question5Game1(
        'assets/pictures/unit5picture2.PNG', 'Сіз үйге бара жатырсыз ба'),
    Question5Game1('assets/pictures/unit5picture3.PNG', 'Жаңбыр жауып тұр ма'),
    Question5Game1(
        'assets/pictures/unit5picture4.PNG', 'Саған кино ұнап жатыр ма'),
    Question5Game1(
        'assets/pictures/unit5picture5.PNG', 'Сағат жұмыс істеп тұр ма'),
    Question5Game1(
        'assets/pictures/unit5picture6.PNG', 'Сіз автобус күтіп тұрсыз ба'),
  ];

  var _endListReached = false;

  String getFieldsPicture() {
    return _fields[indexQuestionShowed].picture;
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

class Question5Game1 {
  final String picture;

  final String answer;
  Question5Game1(this.picture, this.answer);
}
