import 'package:backend_quiz/components/buttons/basic_buttons.dart';
import 'package:backend_quiz/components/inputs/text_inputs.dart';
import 'package:backend_quiz/screens/notification/notification_vm.dart';
import 'package:backend_quiz/screens/quick_add/quick_add_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class NotificationView extends ConsumerWidget {
  ChangeNotifierProvider<NotificationViewModel>? quizViewModel;

  NotificationView({super.key}) {
    quizViewModel = ChangeNotifierProvider<NotificationViewModel>((ref) {
      return NotificationViewModel();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset("assets/img_auth.gif"),
        ],
        centerTitle: true,
        title: Text(
          "Add New Quiz".toUpperCase(),
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                globalTextFormField(
                    controller: ref.read(quizViewModel!).titleController,
                    validator: (value) {},
                    hintText: "Title of the Quiz",
                    labelText: "Title",
                    iconData: Icons.title),
                globalTextFormField(
                    controller: ref.read(quizViewModel!).descController,
                    validator: (value) {},
                    hintText: "Description of the quiz",
                    labelText: "Description",
                    iconData: Icons.description),
                globalTextFormField(
                    controller: ref.read(quizViewModel!).priceController,
                    validator: (value) {},
                    hintText: "Image URL",
                    labelText: "Image",
                    iconData: Icons.image),
                primaryButton(
                    onPressed: () {
                      ref
                          .read(quizViewModel!)
                          .sendNotification(context: context);
                    },
                    title: "Send Notification"),
             
              ],
            ),
          )),
    );
  }
}
