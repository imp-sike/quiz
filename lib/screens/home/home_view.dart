import 'package:backend_quiz/components/cards/navigation_cards.dart';
import 'package:backend_quiz/screens/leaderboard/leaderboard_view.dart';
import 'package:backend_quiz/screens/notification/notification_view.dart';
import 'package:backend_quiz/screens/published/published_view.dart';
import 'package:backend_quiz/screens/quick_add/quick_add_view.dart';
import 'package:backend_quiz/screens/quiz_add/add_quiz_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/img_auth.gif"),
          actions: [
            Image.asset("assets/img_auth.gif"),
          ],
          centerTitle: true,
          title: Text(
            "Quiz App Admin Panel".toUpperCase(),
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                NavigationCard(
                  imageAsset: "assets/add.png",
                  cardText: "Start New Quiz",
                  onTap: () {
                    // Navigate to panel 1
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => QuickAddView()));
                  },
                ),
                NavigationCard(
                  imageAsset: "assets/published.png",
                  cardText: "Published Quizzes",
                  onTap: () {
                    // Navigate to panel 2
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const PublishedView()));
                  },
                ),
                NavigationCard(
                  imageAsset: "assets/draft.png",
                  cardText: "Drafts",
                  onTap: () {
                    // Navigate to panel 3
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                const PublishedView(published: false)));
                  },
                ),
                NavigationCard(
                  imageAsset: "assets/leaderboard.png",
                  cardText: "Score Leaderboard",
                  onTap: () {
                    // Navigate to panel 3
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LeaderboardView()));
                  },
                ),
                NavigationCard(
                  imageAsset: "assets/bell.png",
                  cardText: "Send Push Notification",
                  onTap: () {
                    // Navigate to panel 3
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => NotificationView()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
