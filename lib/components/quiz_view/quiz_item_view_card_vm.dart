import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class QuizItemViewCardVM extends ChangeNotifier {
  String quizQuestionId;
  String docId;

  // controllers
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController correctOptionController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  QuizItemViewCardVM({required this.quizQuestionId, required this.docId}) {
    print(quizQuestionId);

    FirebaseFirestore.instance
        .collection('quiz')
        .doc(docId)
        .collection('questions')
        .doc(quizQuestionId)
        .get()
        .then((value) {
      // print(value.get("title"));
      questionController.text = value.get("title").toString();
      option1Controller.text = value.get("option1").toString();
      option2Controller.text = value.get("option2").toString();
      option3Controller.text = value.get("option3").toString();
      option4Controller.text = value.get("option4").toString();
      correctOptionController.text = value.get("answer").toString();
      remarksController.text = value.get("remarks").toString();
    });
  }

  void updateSingle() {
    FirebaseFirestore.instance
        .collection('quiz')
        .doc(docId)
        .collection('questions')
        .doc(quizQuestionId)
        .update({
      "title": questionController.value.text,
      "option1": option1Controller.value.text,
      "option2": option2Controller.value.text,
      "option3": option3Controller.value.text,
      "option4": option4Controller.value.text,
      "answer": correctOptionController.value.text,
      "remarks": remarksController.value.text,
    });
  }

  void deleteSingle() {
    FirebaseFirestore.instance
        .collection('quiz')
        .doc(docId)
        .collection('questions')
        .doc(quizQuestionId)
        .delete();
  }
}
