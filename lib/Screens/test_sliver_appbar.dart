import 'package:flutter/material.dart';
import 'package:mobflix/Screens/home_page.dart';
import 'package:mobflix/Screens/video_registration.dart';

import '../components/card_presentation.dart';
import '../components/horizontal_categorys.dart';
import '../components/video_banner.dart';

class TestClass extends StatefulWidget {
  TestClass({Key? key}) : super(key: key);
  final List<CardPresentation> _cardsList = [];

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              backgroundColor: const Color.fromRGBO(5, 25, 51, 1),
              // backgroundColor: Colors.transparent,
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
                //  Image.network(
                //   'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                //   fit: BoxFit.cover,
                // ),
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
              // Expanded(
              //   child: ListView(
              //     shrinkWrap: true,
              //     children: [],
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget._cardsList.length,
                  itemBuilder: (context, index) {
                    final dataToCard = widget._cardsList[index];
                    return CardPresentation(
                      url: dataToCard.url,
                      categoryContainer: dataToCard.categoryContainer,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
