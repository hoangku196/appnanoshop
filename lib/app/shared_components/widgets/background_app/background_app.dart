import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        AssetsPath.backgroundImage,
        fit: BoxFit.cover,
      ),
    );
  }
}