import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        future: FirebaseFirestore.instance
            .collection("userinfo")
            .orderBy("score",descending: true)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No any users found"),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildAvatarAndName(
                          snapshot.data!.docs.elementAt(1).get("name"),
                          "Second"),
                      _buildAvatarAndName(
                          snapshot.data!.docs.elementAt(0).get("name"),
                          "First"),
                      _buildAvatarAndName(
                          snapshot.data!.docs.elementAt(2).get("name"),
                          "Third"),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) => Center(
                      child: ListTile(
                          
                            title: Text(
                                snapshot.data!.docs.elementAt(index).get("name")),
                            subtitle: Text(snapshot.data!.docs
                                .elementAt(index)
                                .get("score")
                                .toString()),
                          ),
                    )),
                  )),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error connecting to database!"),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildAvatarAndName(String name, String position) {
    return Column(
      children: <Widget>[
        const CircleAvatar(
          child: Icon(Icons.score),
        ),
        SizedBox(height: 8),
        Text(
          "$position: $name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
