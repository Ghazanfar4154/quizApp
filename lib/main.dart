import 'package:flutter/material.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'Question_Brain.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text('Quiz APP'),
        ),
        body: QuizApp(),
      ),
    ),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuestionBrain qb = new QuestionBrain();
  List<Icon> result = [];
  int Scoor = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 10,
          child: Center(
            child: Container(
                child: Text(
              qb.getData().question,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Expanded(
          child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
        ),
        Expanded(
          child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
        ),
        Row(
          children: result,
        )
      ],
    );
  }

  void checkAnswer(bool ans) {
    setState(() {
      if (qb.isFinshed() == true) {
        alert(context,
            title: Text(
              "Your Quiz  Finshed ",
            ),
            content: Text('you got $Scoor points'));
        qb.rest();
        result = [];
      } else {
        if (ans == qb.getData().answer) {
          result.add(Icon(Icons.check));
          qb.nextQuestion();
          Scoor++;
        } else {
          {
            result.add(Icon(Icons.close));
            qb.nextQuestion();
          }
        }
      }
    });
  }
}
