import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddQuizViewModel extends ChangeNotifier {
  String? docId;

  // controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // boot up the viewmodel
  AddQuizViewModel({this.docId}) {
    if (docId != null) {
      FirebaseFirestore.instance
          .collection('quiz')
          .doc(docId!)
          .get()
          .then((value) {
        // print(value.get("title"));
        titleController.text = value.get("title");
        priceController.text = value.get("price");
        descController.text = value.get("desc");
      });
    }
  }

  // change quiz basic values
  void changeBasicValues({required bool publish, required BuildContext context}) {
    if (docId != null) {
      FirebaseFirestore.instance
          .collection('quiz')
          .doc(docId!).update({
            "title": titleController.value.text,
            "price": priceController.value.text,
            "desc": descController.value.text,
            "published": publish,
            "image": "",
          }).then((value){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Updated Successfully!")));
          });
    }
  }

  void addNewQuestion() {
     FirebaseFirestore.instance
        .collection('quiz')
        .doc(docId)
        .collection('questions')
        .doc()
        .set({
      "title": "",
      "option1": "",
      "option2": "",
      "option3": "",
      "option4": "",
      "answer": "",
      "remarks": "",
      "id": FieldValue.serverTimestamp()
    });
  }
}
