import 'package:flutter/material.dart';

import 'quiz_body.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quizzler'), centerTitle: true),

      body: const SafeArea(child: QuizBody()),
    );
  }
}
