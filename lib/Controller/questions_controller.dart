import '../Model/question_model.dart';

abstract class QuestionController{
  static List<QuestionModel> quizQuestions = [
    QuestionModel(
        question: "1. ¿Cuál de estas NO es una función en un API Gateway?",
        correctAnswer: 'Crear solicitudes que se ejecutan pasado un tiempo',
        options: [
          'Distribuir el acceso para las llamadas de una API',
          'Distribuir las solicitudes entre los microservicios',
          'Crear solicitudes que se ejecutan pasado un tiempo',
          'Crear una llamada de una API que se ejecuta después de un tiempo'
        ]
    ),
    QuestionModel(
        question: "2. ¿En qué capa del modelo OSI se habla de dirección IP (Lógica)",
        correctAnswer: 'Capa de Red',
        options: ['Capa de Presentación', 'Capa de Aplicación', 'Capa de Enlace', 'Capa de Red']
    )
  ];
}