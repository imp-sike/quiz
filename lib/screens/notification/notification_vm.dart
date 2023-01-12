import 'package:backend_quiz/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  // controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // change quiz basic values
  Future<void> sendNotification({required BuildContext context}) async {
    NotificationService().sendNotification(
        title: titleController.value.text,
        text: descController.value.text,
        topic: '/topics/hello',
        data: {"image": priceController.value.text}).then((value) {
      if (value) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Notification sent successfully!")));
        titleController.text = "";
        priceController.text = "";
        descController.text = "";
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Notification sending failed!")));

        titleController.text = "";
        priceController.text = "";
        descController.text = "";
      }
    });

    // FirebaseFirestore.instance.collection('quiz').doc().set({
    //   "title": titleController.value.text,
    //   "price": priceController.value.text,
    //   "desc": descController.value.text,
    //   "published": publish,
    //   "image": "",
    //   "enrolled": 0
    // }).then((value) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text("Added Successfully!")));
    //       Navigator.pop(context);
    // });
  }
}
