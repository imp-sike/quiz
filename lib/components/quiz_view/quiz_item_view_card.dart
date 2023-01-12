import 'package:backend_quiz/components/buttons/basic_buttons.dart';
import 'package:backend_quiz/components/inputs/text_inputs.dart';
import 'package:backend_quiz/components/quiz_view/quiz_item_view_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class QuizItemViewCard extends ConsumerWidget {
  final String quizQuestionId;
  final String docId;

  ChangeNotifierProvider<QuizItemViewCardVM>? quizViewModel;

  QuizItemViewCard(
      {Key? key, required this.quizQuestionId, required this.docId})
      : super(key: key) {
    quizViewModel = ChangeNotifierProvider<QuizItemViewCardVM>((ref) {
      return QuizItemViewCardVM(quizQuestionId: quizQuestionId, docId: docId);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: globalTextFormField(
                    width: 0.6 * MediaQuery.of(context).size.width,
                    controller: ref.read(quizViewModel!).questionController,
                    validator: (value) {},
                    hintText: "Question",
                    labelText: "Question",
                    iconData: Icons.question_mark)),
            Container(
              height: 10,
            ),
            Divider(),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                globalTextFormField(
                    controller: ref.read(quizViewModel!).option1Controller,
                    validator: (value) {},
                    hintText: "Option 1",
                    labelText: "Option 1",
                    iconData: Icons.keyboard_option_key),
                globalTextFormField(
                    controller: ref.read(quizViewModel!).option2Controller,
                    validator: (value) {},
                    hintText: "Option 2",
                    labelText: "Option 2",
                    iconData: Icons.keyboard_option_key),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                globalTextFormField(
                    controller: ref.read(quizViewModel!).option3Controller,
                    validator: (value) {},
                    hintText: "Option 3",
                    labelText: "Option 3",
                    iconData: Icons.keyboard_option_key),
                globalTextFormField(
                    controller: ref.read(quizViewModel!).option4Controller,
                    validator: (value) {},
                    hintText: "Option 4",
                    labelText: "Option 4",
                    iconData: Icons.keyboard_option_key),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                globalTextFormField(
                    controller:
                        ref.read(quizViewModel!).correctOptionController,
                    validator: (value) {},
                    hintText: "Answer",
                    labelText: "Answer",
                    iconData: Icons.keyboard_option_key),
                globalTextFormField(
                    controller: ref.read(quizViewModel!).remarksController,
                    validator: (value) {},
                    hintText: "Remarks",
                    labelText: "Remarks",
                    iconData: Icons.keyboard_option_key),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                primaryButton(onPressed: () {
                  ref.read(quizViewModel!).updateSingle();
                }, title: "Update"),
                primaryButton(
                    onPressed: () {
                  ref.read(quizViewModel!).deleteSingle();

                    },
                    title: "Delete",
                    color: ButtonColors.danger)
              ],
            ),
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
