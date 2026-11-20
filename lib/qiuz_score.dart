import 'package:flutter/material.dart';

class QuizScore extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const QuizScore({
    super.key,
    required this.score,
    required this.total,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Text(
            'Your Score: $score / $total',
            style: const TextStyle(fontSize: 24),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: onRestart,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
