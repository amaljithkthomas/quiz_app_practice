
import 'package:quiz_app_practice/quiz_sections/questionModel.dart';

class QuestionAnswer
{
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(question: 'Lakshadweep is an island', answer: true),
    Question(question: 'One third of the world is covered with water', answer: true),
    Question(question: 'Robots are capable of expressing emotions', answer: false),
    Question(question: 'Glass is manufactured mainly from processed sand', answer: true)
  ];
  String getQuestion()
  {
    return _questionBank[_questionNumber].question;
  }
  bool getAnswer()
  {
    return _questionBank[_questionNumber].answer;
  }
  void nextQuestion()
  {
    if(_questionNumber< _questionBank.length-1)
      {
        _questionNumber++;
      }

  }
  void resetQuiz()
  {
    _questionNumber = 0;
  }
  bool alretMessage()=>_questionNumber >= _questionBank.length-1?true:false;
  // bool statusIndicator()=>_questionNumber < _questionBank.length-1?true:false;


}