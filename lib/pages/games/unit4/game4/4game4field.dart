int lengthfield = Game4Unit4Brain()._fields.length;
var indexQuestionShowed = 0;

class Game4Unit4Brain {
  final _fields = [
    Question4Game4('(мен/шашымды/жуу)', 'Мен шашымды жуып жатырмын',
        'Мен шашымды жуып жатқан жоқпын'),
    Question4Game4('(қар/жауу)', 'Қар жауып жатыр', 'Қар жауып жатқан жоқ'),
    Question4Game4('(мен/креслода/отыру)', 'Мен креслода отырмын',
        'Мен креслода отырған жоқпын'),
    Question4Game4('(мен/жеу)', 'Мен жеп жатырмын', 'Мен жеп жатқан жоқпын'),
    Question4Game4(
        '(жаңбыр/жауу)', 'Жаңбыр жауып жатыр', 'Жанбыр жауып жатқан жоқ'),
    Question4Game4('(мен/қазақша/үйрену)', 'Мен қазақша үйреніп жатырмын',
        'Мен қазақша үйреніп жатқан жоқпын'),
    Question4Game4('(мен/әуен/тыңдау)', 'Мен әуен тыңдап жатырмын',
        'Мен әуен тыңдап жатқан жоқпын'),
    Question4Game4('(күн/шығу)', 'Күн шығып жатыр', 'Күн шығып жатқан жоқ'),
    Question4Game4('(мен/аяқ киім/кию)', 'Мен аяқ киім киіп жатырмын',
        'Мен аяқ киіп жатқан жоқпын'),
    Question4Game4('(мен/газет/оқу)', 'Мен газет оқып жатырмын',
        'Мен газет оқып жатқан жоқпын'),
  ];

  var _endListReached = false;

  String getFieldsTitle() {
    return _fields[indexQuestionShowed].title;
  }

  String getAnswerOfFields() {
    return _fields[indexQuestionShowed].answer;
  }

  String getSecAnswerOfFields() {
    return _fields[indexQuestionShowed].secanswer;
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

class Question4Game4 {
  final String title;
  final String answer;
  final String secanswer;
  Question4Game4(this.title, this.answer, this.secanswer);
}
