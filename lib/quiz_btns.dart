import 'package:flutter/material.dart';

class QuizBtns extends StatelessWidget {
  final Color backgroundColor;
  final String btnTxt;
  final ValueChanged<String> onPressed;

  const QuizBtns({
    super.key,
    this.backgroundColor = Colors.black,
    this.btnTxt = 'Click',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),

      child: SizedBox(
        width: double.infinity,

        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 10),
            foregroundColor: Colors.white,
          ),

          onPressed: () {
            onPressed(btnTxt);
          },

          child: Text(btnTxt, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
