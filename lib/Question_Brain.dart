import 'Question.dart';

class QuestionBrain {
  int n = 0;
  List<Question> questionbrain = [
    Question('10+10=20', true),
    Question('10+1=20', false),
    Question('15+10=20', false),
    Question('10+10=20', true),
    Question('10*20=20', false),
    Question('05+15=20', true),
    Question('8+12=20', true),
    Question('1+19=20', true),
    Question('92+10=20', false),
    Question('1+10=20', false),
    Question('9+10=20', false),
  ];

  Question getData() {
    return questionbrain[n];
  }

  void nextQuestion() {
    if (n < questionbrain.length) n = n + 1;
  }

  void rest() {
    n = 0;
  }

  bool isFinshed() {
    if (n == questionbrain.length - 1)
      return true;
    else
      return false;
  }
}
