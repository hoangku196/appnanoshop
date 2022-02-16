import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';

class TagIcon extends StatelessWidget {
  final int percent;

  const TagIcon({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return percent > 0
        ? Stack(
            children: [
              Image.asset(AssetsSource.tagIcon),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Center(
                    child: Text(
                      '-' + percent.toString() + '%',
                      style: textStyle1.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
