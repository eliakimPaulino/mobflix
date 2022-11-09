import 'package:flutter/material.dart';
import 'package:mobflix/Screens/video_registration.dart';
// import 'package:mobflix/components/videos_list.dart';

import '../components/card_presentation.dart';
import '../components/horizontal_categorys.dart';
import '../components/video_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> cardsList = [
    CardPresentation(
      categoryContainer: categorys[0],
      // context: context,
      url: 'https://youtu.be/yI3AYA3L0xU',
    ),
    CardPresentation(
      categoryContainer: categorys[1],
      url: 'https://youtu.be/fSBLPaj0aWM',
    ),
    CardPresentation(
      categoryContainer: categorys[2],
      // context: context,
      url: 'https://www.youtube.com/watch?v=aBUSyXKz9ho',
    ),
    CardPresentation(
      categoryContainer: categorys[3],
      url: 'https://youtu.be/FmI_mg2CUsU',
    ),
    CardPresentation(
      categoryContainer: categorys[4],
      url: 'https://youtu.be/NJnHLeamghI',
    ),
    CardPresentation(
      categoryContainer: categorys[5],
      url: 'https://youtu.be/jtCfek5b8QY',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(5, 25, 51, 1),
          appBar: AppBar(
            // flexibleSpace: const VideoBanner(),
            backgroundColor: const Color.fromRGBO(12, 67, 136, 1),
            elevation: 0,
            bottom: const TabBar(tabs: [
              Tab(text: 'MOBILE_'),
              Tab(text: 'DEVOPS_'),
              Tab(text: 'PROGRAMAÇÃO_'),
              Tab(text: 'DATA SCIENCE_'),
              Tab(text: 'FRONT-END_'),
              Tab(text: 'UX&UI DESIGN_'),
            ]),
          ),
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

          body: const TabBarView(
            children: [
              Center(
                child: Text('Page 1'),
              ),
              Center(
                child: Text('Page 2'),
              ),
              Center(
                child: Text('Page 3'),
              ),
              Center(
                child: Text('Page 4'),
              ),
              Center(
                child: Text('Page 5'),
              ),
              Center(
                child: Text('Page 6'),
              ),
            ],
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         Color.fromRGBO(5, 25, 51, 1),
          //         Color.fromRGBO(12, 67, 136, 1),
          //         Color.fromRGBO(12, 67, 136, 1),
          //       ],
          //     ),
          //   ),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         // Padding(
          //         //   padding: const EdgeInsets.all(16.0),
          //         //   child: Text(
          //         //     'MOBFLIX',
          //         //     textAlign: TextAlign.center,
          //         //     style: TextStyle(
          //         //       letterSpacing: 4,
          //         //       fontSize: 32,
          //         //       fontWeight: FontWeight.bold,
          //         //       color: Colors.amber[900],
          //         //     ),
          //         //   ),
          //         // ),
          //         // const VideoBanner(
          //         //     // context: context
          //         //     ),
          //         // const CategoryRow(),
          //         Column(
          //           children: [
          //             cardsList[0],
          //             cardsList[1],
          //             // cardsList[2],
          //             // cardsList[3],
          //             // cardsList[4],
          //             // cardsList[5],
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // VideosList(),
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
        padding: const EdgeInsets.all(1.0),
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
