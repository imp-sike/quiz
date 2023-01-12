import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String price;
  final String desc;
  final bool published;
  final String enrolled;
  final Function onTap;

  const QuizCard({
    Key? key,
    required this.imageAsset,
    required this.price,
    required this.title,
    required this.desc,
    required this.published,
    required this.enrolled,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          width: 0.3 * MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(imageAsset), fit: BoxFit.cover),
              ),
              child: Card(
                color: Color.fromARGB(101, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                    Text(title,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 10.0),
                    Text(desc,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 10.0),
                    Text("Price: $price",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text("Enrolled: $enrolled",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ),
        published
            ? Container()
            : Positioned(
                left: 40,
                top: 35,
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(" DRAFT",
                          style: GoogleFonts.poppins(color: Colors.white))
                    ],
                  ),
                ))
      ],
    );
  }
}
