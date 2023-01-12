import 'package:backend_quiz/components/buttons/basic_buttons.dart';
import 'package:backend_quiz/components/quiz_view/quiz_item_view_card.dart';
import 'package:backend_quiz/components/inputs/text_inputs.dart';
import 'package:backend_quiz/screens/quiz_add/add_quiz_vm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class AddQuizView extends ConsumerWidget {
  final String? docId;
  ChangeNotifierProvider<AddQuizViewModel>? quizViewModel;

  AddQuizView({super.key, this.docId}) {
    quizViewModel = ChangeNotifierProvider<AddQuizViewModel>((ref) {
      return AddQuizViewModel(docId: docId);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(quizViewModel!).docId = docId;
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ButtonColors.danger,
        onPressed: () {
          ref.read(quizViewModel!).addNewQuestion();
        },
        child: const Icon(Icons.add,),
      ),
      body: Row(children: [
        SizedBox(
            width: 0.8 * MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("quiz")
                  .doc(docId!)
                  .collection("questions")
                  .orderBy("id")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No any Questions"),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuizItemViewCard(
                            docId: docId!,
                            quizQuestionId: snapshot.data!.docs
                                .elementAt(index).id);
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
        Container(
            width: 0.2 * MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
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
                      hintText: "Price for the Quiz in NPR",
                      labelText: "Price",
                      iconData: Icons.money),
                  primaryButton(
                      onPressed: () {
                        ref.read(quizViewModel!).changeBasicValues(
                            publish: false, context: context);
                      },
                      title: "Save as Draft"),
                  primaryButton(
                      onPressed: () {
                        ref
                            .read(quizViewModel!)
                            .changeBasicValues(publish: true, context: context);
                      },
                      title: "PUBLISH")
                ],
              ),
            )),
      ]),
    );
  }
}
