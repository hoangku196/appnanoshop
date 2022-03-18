abstract class NewsEvent {}

class InitialNewsEvent extends NewsEvent {
  final String? categoryId, newsHot, months, years, id, keyword;

  final int limit;

  InitialNewsEvent({
    this.categoryId,
    this.newsHot,
    this.months,
    this.years,
    this.id,
    this.keyword,
    this.limit = 10,
  });
}

class LoadMoreListNewsEvent extends NewsEvent {}

