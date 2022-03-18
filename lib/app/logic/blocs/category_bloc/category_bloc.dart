import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/logic/event/category_event/category_event.dart';
import 'package:nanoshop_app/app/logic/state/category_state/category_state.dart';
import 'package:nanoshop_app/app/utils/models/category_product_response.dart';
import 'package:nanoshop_app/app/utils/repository/product_repository/product_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductRepository productRepository;

  CategoryBloc({
    required this.productRepository,
  }) : super(CategoryState());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    yield LoadingCategory();
    try {
      List<CategoryProductResponse> _categories =
          await productRepository.getCategory(type: "product");
      yield LoadedCategory(categories: _categories);
    } catch (e) {
      yield LoadedFailureCategory();
    }
  }

  refreshCategory() async {
    try {
      List<CategoryProductResponse> _categories =
          await productRepository.getCategory(type: "product");
      emit(LoadedCategory(categories: _categories));
    } catch (e) {
      emit(state);
    }
  }
}
