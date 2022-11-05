import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.name, required this.color})
      : super(key: key);
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: 32,
          width: 130,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff000000),
                offset: Offset(3, 3),
                blurRadius: 3.0,
                // spreadRadius: 3.0,
                // blurStyle: BlurStyle.outer,
              )
            ],
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

List<CategoryCard> categorys = const [
  CategoryCard(name: 'MOBILE_', color: Color.fromRGBO(254, 185, 5, 1)),
  CategoryCard(name: 'DEVOPS_', color: Color.fromRGBO(232, 93, 98, 1)),
  CategoryCard(name: 'PROGRAMAÇÃO_', color: Color.fromRGBO(0, 198, 109, 1)),
  CategoryCard(name: 'DATA SCIENCE', color: Color.fromRGBO(152, 207, 58, 1)),
  CategoryCard(name: 'FRONT-END_', color: Color.fromRGBO(101, 200, 246, 1)),
  CategoryCard(name: 'UX&UI DESIGN_', color: Color.fromRGBO(214, 107, 185, 1)),
];
