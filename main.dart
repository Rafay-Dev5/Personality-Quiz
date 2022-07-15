import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favourite colour?",
      'answers': [
        {"text": "White", "score": 1},
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 5},
        {"text": "Green", "score": 3}
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {"text": "Lion", "score": 3},
        {"text": "Tiger", "score": 5},
        {"text": "Elephant", "score": 10},
        {"text": "Giraffe", "score": 1}
      ]
    },
    {
      'questionText': "Question?",
      'answers': [
        {"text": "Why?", "score": 10},
        {"text": "Where?", "score": 1},
        {"text": "When?", "score": 3},
        {"text": "How?", "score": 5}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;  
    });
    
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex++);
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("My First App"),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex)
                : Result(_totalScore,_resetQuiz)));
  }
}
