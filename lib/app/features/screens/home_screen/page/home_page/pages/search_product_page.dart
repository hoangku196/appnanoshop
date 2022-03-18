import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/home_page/widgets/search_product_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';

class SearchProductPage extends StatelessWidget {
  SearchProductPage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        appBar: SearchAppBar(
            searchController: _searchController,
        ),
      ),
    );
  }
}
