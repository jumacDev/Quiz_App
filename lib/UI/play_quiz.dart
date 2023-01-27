import 'package:flutter/material.dart';
import 'package:quizz_app/Model/question_model.dart';
import 'package:quizz_app/UI/result_screen.dart';

import '../Controller/questions_controller.dart';
import 'Styles/colors.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({Key? key}) : super(key: key);

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {

  final PageController pagecontroller = PageController();
  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = "", selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: foregroundColor,
          title: const Text(
            'Quiz App',
            style: TextStyle(color: backgroundColor),
          ),
          centerTitle: true,
        ),
        body: PageView.builder(
          controller: pagecontroller,
          physics: const NeverScrollableScrollPhysics(),
            itemCount: QuestionController.quizQuestions.length,
            itemBuilder: (context, index) {
              QuestionModel question = QuestionController.quizQuestions[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        question.question,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: List.generate(
                          question.options.length,
                          (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isAnswerLocked = true;
                                    selectedAnswer = question.options[index];
                                    correctAnswer = question.correctAnswer;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: foregroundColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: selectedAnswer == question.options[index] ? foregroundColor : backgroundColor,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(14),
                                  child: Text(
                                    question.options[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ))),
                    )
                  ],
                ),
              );
            }),
        bottomNavigationBar: InkWell(
          onTap: () {
            if(isAnswerLocked){
              if(selectedAnswer == correctAnswer){
                correctAnswers++;
              }else{
                wrongAnswers++;
              }
              currentIndex++;
              if(currentIndex != QuestionController.quizQuestions.length){
                pagecontroller.jumpToPage(currentIndex);
              }else{
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => ResultScreen(wrongAnswers: wrongAnswers, correctAnswers: correctAnswers)), (route) => false);
              }
            }else {
              print('Opción incorrecta');
            }
          },
          child: Container(
            height: 60,
            color: foregroundColor,
            alignment: Alignment.center,
            child: const Text(
              'Siguiente',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: backgroundColor),
            ),
          ),
        ));
  }
}
