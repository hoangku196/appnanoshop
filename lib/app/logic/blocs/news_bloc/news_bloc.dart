import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/logic/event/news_event/news_event.dart';
import 'package:nanoshop_app/app/logic/state/news_state/news_state.dart';
import 'package:nanoshop_app/app/utils/models/news_response.dart';
import 'package:nanoshop_app/app/utils/repository/news_repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  int _page = 1;

  List<NewsResponse> _listNews = [];

  bool _hasMore = true;

  String? _months, _newsHot, _years, _keyword, _categoryId;
  String? _id;

  int _limit = 0;

  NewsBloc({
    required this.newsRepository,
  }) : super(NewsState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is InitialNewsEvent) {
      yield LoadingNewsState();
      try {
        _keyword = event.keyword;
        _categoryId = event.categoryId;
        _months = event.months;
        _newsHot = event.newsHot;
        _years = event.years;
        _limit = event.limit;
        _id = event.id;
        List<NewsResponse> data = await newsRepository.getListNews(
          page: _page,
          categoryId: _categoryId,
          keyword: _keyword,
          limit: _limit,
          id: _id,
          months: _months,
          newsHot: _newsHot,
          years: _years,
        );

        if (data.isNotEmpty) {
          _listNews.addAll(data);
        } else {
          _hasMore = false;
        }

        if (_listNews.length < _limit) {
          _hasMore = false;
        }

        yield LoadedNewsState(
          hasMore: _hasMore,
          listNews: _listNews,
        );
      } catch (e) {}
    }

    if (event is LoadMoreListNewsEvent) {
      try {
        List<NewsResponse> data = await newsRepository.getListNews(
          page: ++_page,
          categoryId: _categoryId,
          keyword: _keyword,
          limit: _limit,
          id: _id,
          months: _months,
          newsHot: _newsHot,
          years: _years,
        );

        if (data.isNotEmpty) {
          _listNews.addAll(data);
        } else {
          _hasMore = false;
        }

        if (_listNews.length < 10) {
          _hasMore = false;
        }

        yield LoadedNewsState(
          hasMore: _hasMore,
          listNews: _listNews,
        );
      } catch (e) {}
    }
  }

  refreshList() async {
    _hasMore = true;
    _page = 1;
    _listNews.clear();
    try {
      List<NewsResponse> data = await newsRepository.getListNews(
        page: _page,
        categoryId: _categoryId,
        keyword: _keyword,
        limit: _limit,
        id: _id,
        months: _months,
        newsHot: _newsHot,
        years: _years,
      );

      if (data.isNotEmpty) {
        _listNews.addAll(data);
      } else {
        _hasMore = false;
      }

      if (_listNews.length < 10) {
        _hasMore = false;
      }

      emit(
        LoadedNewsState(
          hasMore: _hasMore,
          listNews: _listNews,
        ),
      );
    } catch (e) {
      emit(state);
    }
  }
}
