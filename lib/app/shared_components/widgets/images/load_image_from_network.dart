import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/api_path/api_path.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class LoadImageFromNetwork extends StatelessWidget {
  final String url;
  final double kHeightErrorIcon;

  const LoadImageFromNetwork({
    Key? key,
    required this.url,
    this.kHeightErrorIcon = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        ApiPath.baseImageUrl + url,
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) {
          return Center(
            child: Icon(
              Icons.image_not_supported,
              size: kHeightErrorIcon,
              color: AppColor.color13,
            ),
          );
        },
      ),
    );
  }
}
