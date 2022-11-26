import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/Screens/home_page.dart';
import 'package:mobflix/data/card_data.dart';
// import 'package:mobflix/Screens/home_page.dart';

// import 'Screens/home_page.dart';
// import 'Screens/video_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'MOBFLIX',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.orange,
      ),
      home: CardInheritedData(child: const HomePage()),
    );
  }
}
