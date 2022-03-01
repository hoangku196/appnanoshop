import 'package:flutter/material.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/widgets/search_product_app_bar.dart';
import 'package:nanoshop_app/widgets/remove_focus_widget/remove_focus_widget.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        appBar: SearchAppBar(),
      ),
    );
  }
}
