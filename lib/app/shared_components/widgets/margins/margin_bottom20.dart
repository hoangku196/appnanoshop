import 'package:flutter/material.dart';

class MarginBottom20 extends StatelessWidget {
  final Widget child;

  const MarginBottom20({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: child,
    );
  }
}
