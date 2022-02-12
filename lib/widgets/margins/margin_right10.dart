import 'package:flutter/material.dart';

class MarginRight10 extends StatelessWidget {
  final Widget child;

  const MarginRight10({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: child,
    );
  }
}
