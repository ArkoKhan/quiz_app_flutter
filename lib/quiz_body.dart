import 'package:flutter/material.dart';

import 'quiz_ques.dart';
import 'quiz_btns.dart';
import 'qiuz_score.dart';
import 'quiz_api.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({super.key});

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  final List<String> btnText = ['True', 'False'];

  final List<Color> btnColor = [Colors.green, Colors.red];

  late List<dynamic> data;

  bool isLoading = true;
  String? errorMessage;

  int questionIndex = 0;
  int score = 0;

  bool answered = false;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      data = await QuizApi().getData();
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  // Check answer and automatically move to next question
  void press(String answer) async {
    if (answered) return;

    setState(() {
      answered = true;

      if (answer == data[questionIndex]['correct_answer']) {
        score++;
      }
    });

    // Wait before displaying the next question
    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;

    nextQuestion();
  }

  // Move to next question
  void nextQuestion() {
    setState(() {
      if (questionIndex < data.length - 1) {
        questionIndex++;
        answered = false;
      } else {
        questionIndex = data.length;
      }
    });
  }

  // Restart quiz
  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display final score
    if (questionIndex >= data.length) {
      return QuizScore(
        score: score,
        total: data.length,
        onRestart: restartQuiz,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Question
          QuizQues(question: data[questionIndex]['question']),

          // True / False buttons
          Row(
            children: List.generate(btnText.length, (index) {
              return Expanded(
                child: QuizBtns(
                  backgroundColor: btnColor[index],
                  btnTxt: btnText[index],
                  onPressed: press,
                ),
              );
            }),
          ),

          // Current score
          Text(
            'Score: $score',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
