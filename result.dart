import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText = "";
    if (resultScore <= 8) {
      resultText = "Innocence!";
    } else if (resultScore >= 8 && resultScore <= 12) {
      resultText = "Likable!";
    } else if (resultScore <= 16) {
      resultText = "Interesting!";
    } else {
      resultText = "Very Interesting!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetQuiz, child: const Text("Restart Quiz!"),style: TextButton.styleFrom(primary: Colors.blue),)
        ],
      ),
    ));
  }
}
