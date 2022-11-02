import 'package:flutter/material.dart';

class Categorys extends StatelessWidget {
  const Categorys({Key? key, required this.name, required this.color})
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
