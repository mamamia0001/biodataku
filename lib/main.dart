import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import font_awesome_flutter

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1B1B),
        elevation: 0,
        title: Text(
          'hen.',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Home",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "About",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Blog",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Social",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          // Adjust sizes based on screen width
          double profileImageSize = screenWidth < 600 ? 80 : 120;
          double textFontSize = screenWidth < 600 ? 24 : 32;
          double subTextFontSize = screenWidth < 600 ? 14 : 16;
          double buttonFontSize = screenWidth < 600 ? 14 : 16;
          double iconSize = screenWidth < 600 ? 20 : 24;
          double padding = screenWidth < 600 ? 16 : 32;

          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: padding * 2),
                    if (screenWidth >= 800) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/profile_image.png',
                              width: profileImageSize * 2,
                              height: profileImageSize * 2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: padding),
                          Flexible(
                            child: buildIntroText(
                              textFontSize,
                              subTextFontSize,
                              buttonFontSize,
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/profile_image.png',
                          width: profileImageSize * 2,
                          height: profileImageSize * 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: padding),
                      buildIntroText(
                          textFontSize, subTextFontSize, buttonFontSize),
                    ],
                    SizedBox(height: padding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.email),
                          color: Colors.white,
                          iconSize: iconSize,
                        ),
                        SizedBox(width: padding / 2),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons
                              .instagram), // Menggunakan ikon Instagram
                          color: Colors.white,
                          iconSize: iconSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildIntroText(
      double titleSize, double subTitleSize, double buttonFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi There,',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "I'm Mahendra, nice to meet you! Recently I've been busy in college \n"
          "but anyway you can find me with 42230061\n"
          "Student's number in the Information Technology,Engineering Faculties",
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: subTitleSize,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.white),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: buttonFontSize,
              fontWeight: FontWeight.bold,
            ),
            shadowColor: Colors.transparent,
          ).copyWith(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.white24;
                if (states.contains(MaterialState.pressed))
                  return Colors.white38;
                return null;
              },
            ),
          ),
          child: Text(
            "FIND ME",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
