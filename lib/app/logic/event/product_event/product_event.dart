abstract class ProductEvent {}

class InitialProductEvent extends ProductEvent {
  final String? categoryId, isNew, isHot, isSelling, keyword;
  final int? page;
  final int limit;

  InitialProductEvent({
    this.categoryId,
    this.isNew,
    this.isHot,
    this.isSelling,
    this.keyword,
    this.limit = 10,
    this.page,
  });
}

class LoadMoreListProductEvent extends ProductEvent {}
