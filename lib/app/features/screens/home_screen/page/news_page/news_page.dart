import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:get/get.dart';
import 'package:nanoshop_app/app/features/screens/detail_news_screen/arguments/detail_news_arguments_screen.dart';

import 'package:nanoshop_app/app/features/screens/home_screen/page/news_page/widgets/news_list_tile.dart';
import 'package:nanoshop_app/app/logic/blocs/news_bloc/news_bloc.dart';
import 'package:nanoshop_app/app/logic/event/news_event/news_event.dart';
import 'package:nanoshop_app/app/logic/state/news_state/news_state.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_new.dart';
import 'package:nanoshop_app/app/utils/repository/news_repository/news_repository.dart';

import '../../../../../config/router/router_app.dart';
import '../../../../../shared_components/widgets/loading_widget/shimmer_news_list.dart';

class NewsPage extends StatefulWidget {
  final dynamic idRoute;

  const NewsPage({
    Key? key,
    required this.idRoute,
  }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc _newsBloc = NewsBloc(newsRepository: NewsRepository())
    ..add(
      InitialNewsEvent(),
    );

  ScrollController _listViewController = ScrollController();

  Future<void> _onRefresh() async {
    await _newsBloc.refreshList();
  }

  @override
  void initState() {
    super.initState();
    _listViewController.addListener(_onScroll);
  }

  _onScroll() {
    if (_listViewController.position.pixels ==
        _listViewController.position.maxScrollExtent) {
      _newsBloc.add(LoadMoreListNewsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        title: 'Tin tức',
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: FlutterBloc.BlocBuilder(
          bloc: _newsBloc,
          builder: (context, NewsState state) {
            if (state is LoadingNewsState) {
              return ShimmerNewsList();
            }

            if (state is LoadedNewsState) {
              return ListView.builder(
                itemCount: state.listNews.length,
                controller: _listViewController,
                itemBuilder: (context, index) {
                  return NewListTile(
                    onTap: () {
                      Get.toNamed(
                        RouterApp.detailNewsScreen,
                        arguments: DetailNewArgumentScreen(
                          model: state.listNews[index],
                          bloc: _newsBloc,
                          page: index,
                        ),
                      );
                    },
                    model: state.listNews[index],
                  );
                },
              );
            }

            return Center(
              child: Text('Lỗi'),
            );
          },
        ),
      ),
    );
  }
}
