import 'package:flutter/material.dart';

import 'package:quiz_app_practice/quiz_sections/questionAndAnswer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionAnswer questionAnswer = QuestionAnswer();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void displayStatus(bool selectedAnswer) async {
    bool correctAnswer = questionAnswer.getAnswer();

    setState(() {
      if (questionAnswer.alretMessage() == true) {
        Alert(
            context: context,
            title: "Quiz Finished",
            desc: 'You\'ve reached question limit',
            buttons: [
              DialogButton(
                child: Text("Score"),
                onPressed: () {},
              ),
              DialogButton(
                child: Text("Exit"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    questionAnswer.resetQuiz();
                    scoreKeeper = [];
                  });
                },
              )
            ]).show();
      } else {
        correctAnswer == selectedAnswer
            ? scoreKeeper.add(
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              )
            : scoreKeeper.add(
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              );

        questionAnswer.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionAnswer.getQuestion(),
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                displayStatus(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                displayStatus(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
