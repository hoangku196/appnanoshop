import 'package:flutter/material.dart';

class MarginBottom10 extends StatelessWidget {
  final Widget child;

  const MarginBottom10({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: child,
    );
  }
}
