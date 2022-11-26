import 'package:flutter/material.dart';
import '../components/text_form_component.dart';

class VideoReagistration extends StatelessWidget {
  const VideoReagistration({Key? key, required this.registrationContext})
      : super(key: key);

  final BuildContext registrationContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(12, 67, 136, 1),
              Color.fromRGBO(12, 67, 136, 1),
              Color.fromRGBO(5, 25, 51, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageTitle(context),
              MyCustomTextFild(customTextFildContext: registrationContext),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageTitle(context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: screenSize.height * .15,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(254, 185, 5, 1),
              ),
            ),
            SizedBox(width: screenSize.width * .11),
            const Text(
              'Cadastre um vídeo',
              style: TextStyle(
                letterSpacing: 4,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(254, 185, 5, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
