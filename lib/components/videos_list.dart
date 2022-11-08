import 'package:flutter/material.dart';

import 'card_presentation.dart';
// import 'horizontal_categorys.dart';

class VideosList extends StatefulWidget {
  VideosList({Key? key}) : super(key: key);

  final List<CardPresentation> _listCardPresentation = [];
  

  @override
  State<VideosList> createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._listCardPresentation.length,
        itemBuilder: ((context, index) {
          final dataToList = widget._listCardPresentation[index];
          return CardPresentation(url: '', categoryContainer: dataToList);
        }),
      ),
    );
  }
}
