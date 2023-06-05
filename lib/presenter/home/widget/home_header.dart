import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Saiba tudo sobre seus Dog\'s preferidos',
              style: GoogleFonts.roboto()
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: TextField(
              onChanged: (value) => {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12)),
                fillColor: Colors.black,
                filled: true,
                labelText: 'Procurar raça..',
                labelStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Todas as raças',
                style: GoogleFonts.titanOne()
                    .copyWith(color: Colors.grey[800], fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
