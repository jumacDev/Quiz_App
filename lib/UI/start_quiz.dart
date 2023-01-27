import 'package:flutter/material.dart';
import 'package:quizz_app/UI/play_quiz.dart';

import 'Styles/colors.dart';


class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
       appBar: AppBar(
         title: const Text(
             "Iniciar Quiz",
          style: TextStyle(color: backgroundColor),),
         centerTitle: true,
         backgroundColor: foregroundColor,
       ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            const Text('Quiz App',
              style: TextStyle(
                color: foregroundColor,
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PlayQuizScreen()), (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: foregroundColor,
                ),
                child: const Text(
                  'Iniciar Quiz',
                  style: TextStyle(color: backgroundColor),
                )
            )
          ],
        ),
      )
    );
  }
}