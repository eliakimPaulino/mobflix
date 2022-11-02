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
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'MOBFLIX',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[900],
                    ),
                  ),
                ),
                VideoBanner(context: context),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Categorys(
                            name: 'Mobile',
                            color: Color.fromRGBO(254, 185, 5, 1)),
                        Categorys(
                            name: 'Devops',
                            color: Color.fromRGBO(232, 93, 98, 1)),
                        Categorys(
                            name: 'Programação',
                            color: Color.fromRGBO(0, 198, 109, 1)),
                        Categorys(
                            name: 'Data Science',
                            color: Color.fromRGBO(152, 207, 58, 1)),
                        Categorys(
                            name: 'Front End',
                            color: Color.fromRGBO(101, 200, 246, 1)),
                        Categorys(
                            name: 'UX e Design',
                            color: Color.fromRGBO(214, 107, 185, 1)),
                      ],
                    ),
                  ),
                ),
                // CardPresentation(
                //     context: context,
                //     link: 'https://www.youtube.com/watch?v=uOagLB3uyeU'),
                // const SizedBox(height: 15),
                CardPresentation(
                  context: context,
                  url:
                      'https://www.youtube.com/watch?v=P4BNi_yPehc&list=PLh2Y_pKOa4UciHMCIdxq96xX_L0gX2rYg&index=1&ab_channel=AluraCursosOnline',
                  videoTitle: 'O que são Git e Github?\n#HipstersPontoTube',
                  name: 'Programação',
                  color: const Color.fromRGBO(0, 198, 109, 1),
                ),
                const SizedBox(height: 15),
                CardPresentation(
                  context: context,
                  url: 'https://www.youtube.com/watch?v=uOagLB3uyeU',
                  videoTitle:
                      'Como aprender melhor?\nCom Diogo Pires | #HipstersPontoTube',
                  name: 'Mobile',
                  color: const Color.fromRGBO(254, 185, 5, 1),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
