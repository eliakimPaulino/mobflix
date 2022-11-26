// ignore_for_file: prefer_const_constructors, overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

import '../components/card_presentation.dart';
// import '../components/horizontal_categorys.dart';

class CardInheritedData extends InheritedWidget {
  CardInheritedData({Key? key, required this.child})
      : super(key: key, child: child);

  final Widget child;

  final List<CardPresentation> cardsList = [];

  void newCard(String url, int index) {
    cardsList.add(CardPresentation(
      url: url,
      index: index,
    ));
  }

  static CardInheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardInheritedData>();
  }

  @override
  bool updateShouldNotify(CardInheritedData oldWidget) {
    return oldWidget.cardsList.length != cardsList.length;
  }
}
