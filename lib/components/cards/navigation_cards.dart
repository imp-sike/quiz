import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationCard extends StatelessWidget {
  final String imageAsset;
  final String cardText;
  final Function onTap;

  const NavigationCard({
    Key? key,
    required this.imageAsset,
    required this.cardText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: 0.3 * MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  imageAsset,
                  height: 0.07 * MediaQuery.of(context).size.height,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(cardText, style: GoogleFonts.poppins(fontSize: 20)),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
