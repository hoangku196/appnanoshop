import 'package:flutter/material.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/widgets/category_product_fragment_app_bar.dart';
import 'package:nanoshop_app/widgets/remove_focus_widget/remove_focus_widget.dart';

class SearchProductFragment extends StatelessWidget {
  const SearchProductFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        appBar: CategoryProductFragmentAppBar(),
      ),
    );
  }
}
