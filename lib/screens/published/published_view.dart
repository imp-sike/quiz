import 'package:backend_quiz/components/cards/quiz_card.dart';
import 'package:backend_quiz/screens/quiz_add/add_quiz_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PublishedView extends ConsumerWidget {
  final bool published;
  const PublishedView({super.key, this.published = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset("assets/img_auth.gif"),
        ],
        centerTitle: true,
        title: Text(
          "All Quizzes".toUpperCase(),
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("quiz").get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error connecting to server!"),
              );
            }
            if (snapshot.hasData) {
              if ((snapshot.data as QuerySnapshot<Map>)
                  .docs
                  .where((element) => (element.get("published") == published))
                  .isEmpty) {
                return const Center(
                  child: Text("No any data found!"),
                );
              }
              return GridView.builder(
                  itemCount: (snapshot.data as QuerySnapshot<Map>)
                      .docs
                      .where(
                          (element) => (element.get("published") == published))
                      .length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3, crossAxisCount: 3),
                  itemBuilder: (BuildContext c, int index) {
                    DocumentSnapshot docSnap =
                        (snapshot.data as QuerySnapshot<Map>)
                            .docs
                            .where((element) =>
                                (element.get("published") == published))
                            .elementAt(index);
                    return QuizCard(
                        published: docSnap.get("published"),
                        imageAsset: docSnap.get("image"),
                        title: docSnap.get("title"),
                        desc: docSnap.get("desc"),
                        price: docSnap.get("price"),
                        enrolled: docSnap.get("enrolled").toString(),
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => AddQuizView(
                            docId: docSnap.id
                          )));
                        });
                  });
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
