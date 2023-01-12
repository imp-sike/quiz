import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuickAddViewModel extends ChangeNotifier {
  // controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // change quiz basic values
  void changeBasicValues(
      {required bool publish, required BuildContext context}) {
    FirebaseFirestore.instance.collection('quiz').doc().set({
      "title": titleController.value.text,
      "price": priceController.value.text,
      "desc": descController.value.text,
      "published": publish,
      "image": "",
      "enrolled": 0
    }).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Added Successfully!")));
          Navigator.pop(context);
    });
  }
}
