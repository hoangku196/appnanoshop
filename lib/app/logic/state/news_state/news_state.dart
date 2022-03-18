import 'package:nanoshop_app/app/utils/models/news_response.dart';

class NewsState {}

class LoadingNewsState extends NewsState {}

class LoadedNewsState extends NewsState {
  final List<NewsResponse> listNews;
  final bool hasMore;

  LoadedNewsState({
    required this.listNews,
    required this.hasMore,
  });
}
