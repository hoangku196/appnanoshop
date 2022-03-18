import 'package:flutter/material.dart';

class MainMargin extends StatelessWidget {
  final Widget child;

  const MainMargin({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: child,
    );
  }
}
