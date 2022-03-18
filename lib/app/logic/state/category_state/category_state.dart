import '../../../utils/models/category_product_response.dart';

class CategoryState {}

class LoadingCategory extends CategoryState {}

class LoadedCategory extends CategoryState {
  final List<CategoryProductResponse> categories;

  LoadedCategory({
    required this.categories,
  });
}

class LoadedFailureCategory extends CategoryState {}
