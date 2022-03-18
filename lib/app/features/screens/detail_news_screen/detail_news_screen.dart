import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:flutter_html/flutter_html.dart';
import 'package:nanoshop_app/app/features/screens/detail_news_screen/arguments/detail_news_arguments_screen.dart';
import 'package:nanoshop_app/app/logic/event/news_event/news_event.dart';
import 'package:nanoshop_app/app/logic/state/news_state/news_state.dart';
import 'package:nanoshop_app/app/utils/models/news_response.dart';
import 'package:nanoshop_app/app/utils/repository/news_repository/news_repository.dart';

import '../../../shared_components/widgets/app_bar/page_app_bar.dart';

class DetailNewsScreen extends StatefulWidget {
  final DetailNewArgumentScreen arguments;

  const DetailNewsScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  _DetailNewsScreenState createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.arguments.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        title: '←→ Trượt để xem tin tức ',
      ),
      body: FlutterBloc.BlocBuilder(
        bloc: widget.arguments.bloc,
        builder: (context, state) {
          if (state is LoadedNewsState) {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is OverscrollNotification) {
                  widget.arguments.bloc.add(
                    LoadMoreListNewsEvent(),
                  );
                  return true;
                } else {
                  return false;
                }
              },
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {},
                children: state.listNews.map((e) {
                  return LoadDetailNews(
                    newsId: e.newsId ?? '0',
                  );
                }).toList(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

class LoadDetailNews extends StatelessWidget {
  final String newsId;

  const LoadDetailNews({
    Key? key,
    required this.newsId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsRepository().getDetail(newsId: newsId),
      builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
              child: Html(data: snapshot.data!.newsDesc ?? 'a'));
        }
        return Container();
      },
    );
  }
}
