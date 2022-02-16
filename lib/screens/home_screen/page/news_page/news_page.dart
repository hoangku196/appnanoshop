import 'package:flutter/material.dart';
import 'package:nanoshop_app/screens/home_screen/page/news_page/widgets/news_list_tile.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_new.dart';
import 'package:nanoshop_app/widgets/app_bar/page_app_bar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        title: 'Tin tức',
      ),
      body: ListView.builder(
        itemCount: dummyNew.length,
        itemBuilder: (context, index) {
          return NewListTile(
            model: dummyNew[index],
          );
        },
      ),
    );
  }
}
