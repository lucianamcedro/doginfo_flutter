import 'package:doginfo/presenter/home/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      key: scaffoldKey,
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Row(
          children: [
            Image.asset(
              'assets/images/pata.png',
              width: 20,
              color: Colors.amber[800],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Dogs',
                style: GoogleFonts.fredokaOne().copyWith(
                    color: Colors.grey[800], fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(
            'assets/images/icon-menu.png',
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: const [HomeHeader(), HomeCards()],
      ),
    );
  }
}
