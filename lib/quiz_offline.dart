import 'dart:convert';
import 'dart:math';

String quizData01 =
    '{"response_code":0,"results":[{"type":"boolean","difficulty":"easy","category":"Entertainment: Cartoon &amp; Animations","question":"Waylon Smithers from &quot;The Simpsons&quot; was originally black when he first appeared in the series.","correct_answer":"True","incorrect_answers":["False"]},{"type":"boolean","difficulty":"easy","category":"Entertainment: Video Games","question":"In the game &quot;Destiny,&quot; the three subclasses of the Hunter are Bladedancer, Nightstalker, and Sunsinger.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"History","question":"Thomas Crapper was a plumber who invented the flushing toilet.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"Entertainment: Video Games","question":"Super Mario Bros. was the first video game ever created.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"Entertainment: Video Games","question":"Codemasters is the developer of the Gran Turismo series.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"Animals","question":"Rabbits are rodents.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"Animals","question":"A flock of crows is known as a homicide.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"Entertainment: Video Games","question":"The ultimate phrase used by Pharah from Overwatch is: &quot;Justice rains from above!&quot;","correct_answer":"True","incorrect_answers":["False"]},{"type":"boolean","difficulty":"easy","category":"Entertainment: Film","question":"The film &quot;2001: A Space Odyssey&quot; was released on December 31st, 2000.","correct_answer":"False","incorrect_answers":["True"]},{"type":"boolean","difficulty":"easy","category":"Entertainment: Musicals &amp; Theatres","question":"&quot;The Crucible&quot; was written by William Shakespeare.","correct_answer":"False","incorrect_answers":["True"]}]}';

class QuizOffline {
  List<dynamic> getData() {
    Map<String, dynamic> data = jsonDecode(quizData01);
    return data['results'];
  }

  Map<String, dynamic> randomQuestion() {
    List<dynamic> data = getData();
    int index = Random().nextInt(data.length);
    return data[index];
  }
}
