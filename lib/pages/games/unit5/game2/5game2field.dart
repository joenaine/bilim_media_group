int lengthfield = Game2Unit5Brain()._fields.length;
var indexQuestionShowed = 0;

class Game2Unit5Brain {
  final _fields = [
    Question5Game1('assets/pictures/unit5/game2/1.PNG', 'оқып'),
    Question5Game1('assets/pictures/unit5/game2/2.PNG', 'бара'),
    Question5Game1('assets/pictures/unit5/game2/3.PNG', 'жеп'),
    Question5Game1('assets/pictures/unit5/game2/4.PNG', 'жылап'),
    Question5Game1('assets/pictures/unit5/game2/5.PNG', 'қарап'),
    Question5Game1('assets/pictures/unit5/game2/6.PNG', 'күліп'),
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
