import 'package:flutter/material.dart';

class FontGede extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final TextAlign align;
  const FontGede({
    Key?key,
    this.size = 30,
    required this.text,
    this.color = Colors.white,
    this.align = TextAlign.start
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
class FontKecil extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final TextAlign align;
  const FontKecil({
    Key?key,
    this.size = 15,
    required this.text,
    this.color = Colors.white54,
    this.align = TextAlign.start
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
