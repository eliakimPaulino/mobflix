import 'package:flutter/material.dart';
import 'package:mobflix/Screens/video_registration.dart';

import '../components/card_presentation.dart';
import '../components/horizontal_categorys.dart';
import '../components/video_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const VideoReagistration();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // constraints: const BoxConstraints(maxWidth: 515),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(5, 25, 51, 1),
                Color.fromRGBO(12, 67, 136, 1),
                Color.fromRGBO(12, 67, 136, 1),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'MOBFLIX',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 4,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[900],
                        ),
                      ),
                    ),
                    VideoBanner(context: context),
                    const CategoryRow(),
                    CardPresentation(
                      categoryContainer: categorys[0],
                      // context: context,
                      url:
                          // 'https://www.youtube.com/watch?v=P4BNi_yPehc&list=PLh2Y_pKOa4UciHMCIdxq96xX_L0gX2rYg&index=1&ab_channel=AluraCursosOnline',
                          'https://youtu.be/yI3AYA3L0xU',
                      // name: 'Outros',
                      // color: const Color.fromARGB(255, 255, 145, 0),
                    ),
                    CardPresentation(
                      categoryContainer: categorys[1],
                      // context: context,
                      url:
                          // 'https://www.youtube.com/watch?v=imB0QVoNrGc',
                          'https://youtu.be/fSBLPaj0aWM',
                      // name: 'Programação',
                      // color: const Color.fromRGBO(0, 198, 109, 1),
                    ),
                  ],
                ),
                // const VideosList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  const CategoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            categorys[0],
            categorys[1],
            categorys[2],
            categorys[3],
            categorys[4],
            categorys[5],
          ],
        ),
      ),
    );
  }
}
