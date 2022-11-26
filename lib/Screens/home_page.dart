import 'package:flutter/material.dart';
import 'package:mobflix/Screens/video_registration.dart';
import 'package:mobflix/data/card_data.dart';

import '../components/horizontal_categorys.dart';
import '../components/video_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => VideoReagistration(
                registrationContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              backgroundColor: const Color.fromRGBO(5, 25, 51, 1),
              expandedHeight: 234,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'MOBFLIX',
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900],
                  ),
                ),
                background: const VideoBanner(),
              ),
              floating: true,
            ),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: Column(
            children: [
              const CategoryRow(),
              Expanded(
                child: ListView(
                  // shrinkWrap: true,
                  children: CardInheritedData.of(context)!.cardsList,
                ),
              ),
            ],
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
    );
  }
}
