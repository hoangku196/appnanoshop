import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/utils/global_key/global_key_app.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Size get preferredSize => Size.fromHeight(110);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _showSuffixIcon = false;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTyping);
  }

  _onTyping() {
    widget.searchController.text.isNotEmpty
        ? _showSuffixIcon = true
        : _showSuffixIcon = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            AssetsPath.backgroundAppBar,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          // height: preferredSize.height,
          child: SafeArea(
            child: MainMargin(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        try {
                          Get.keys[GlobalKeyApp.idHomeAppNav]!.currentState!
                              .maybePop();
                        } catch (e) {}
                      },
                      child: Icon(
                        Platform.isAndroid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          autofocus: true,
                          controller: widget.searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: _showSuffixIcon
                                ? InkWell(
                                    onTap: () {
                                      widget.searchController.clear();
                                    },
                                    child: Icon(Icons.close),
                                  )
                                : null,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Image.asset(AssetsPath.appBarFilterIcon),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
