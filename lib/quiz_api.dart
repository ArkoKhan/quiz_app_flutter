import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class QuizApi {
  Future<List<dynamic>> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://opentdb.com/api.php?amount=10&difficulty=easy&type=boolean&encode=url3986',
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load quiz data');
    }
  }

  Future<Map<String, dynamic>> singleQuestion() async {
    List<dynamic> questions = await getData();
    int random = Random().nextInt(questions.length);
    Map<String, dynamic> question = await questions[random];
    return question;
  }
}
