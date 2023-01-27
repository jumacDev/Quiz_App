import 'package:flutter/material.dart';
import 'package:quizz_app/UI/Styles/colors.dart';
import 'package:quizz_app/UI/play_quiz.dart';
import 'package:quizz_app/UI/start_quiz.dart';

class ResultScreen extends StatelessWidget {

  final int correctAnswers, wrongAnswers;

  const ResultScreen({super.key, required this.wrongAnswers, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: foregroundColor,
        title: const Text(
          'Resultados:',
          style: TextStyle(color: backgroundColor),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                answerTab('Repuestas Correctas', correctAnswers),
                answerTab('Repuestas Incorrectas', wrongAnswers),
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => const PlayQuizScreen()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: foregroundColor),
                child: const Text(
                  'Reiniciar Quiz',
                  style: TextStyle(color: backgroundColor),
                )
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => const StartQuizScreen()),
                          (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: foregroundColor),
                child: const Text(
                  'Pantalla de Inicio',
                  style: TextStyle(color: backgroundColor),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget answerTab(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          '$value',
          style: const TextStyle(
            color: foregroundColor,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
