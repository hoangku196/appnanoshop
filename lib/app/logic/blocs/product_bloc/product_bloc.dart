import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/utils/models/product_response.dart';

import '../../../utils/repository/product_repository/product_repository.dart';
import '../../event/product_event/product_event.dart';
import '../../state/product_state/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  int _page = 1;

  List<ProductResponse> _listProduct = [];

  bool _hasMore = true;

  String? _isNew, _isHot, _isSelling, _keyword, _categoryId;

  int? _limit;

  ProductBloc({
    required this.productRepository,
  }) : super(ProductState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is InitialProductEvent) {
      yield LoadingProductState();
      try {
        _isNew = event.isNew;
        _isHot = event.isHot;
        _isSelling = event.isSelling;
        _keyword = event.keyword;
        _categoryId = event.categoryId;
        _limit = event.limit;
        List<ProductResponse> data = await productRepository.getListProduct(
          page: _page,
          isNew: _isNew,
          isHot: _isHot,
          limit: _limit,
          isSelling: _isSelling,
          categoryId: _categoryId,
          keyword: _keyword,
        );

        if (data.isNotEmpty) {
          _listProduct.addAll(data);
        } else {
          _hasMore = false;
        }

        if (_listProduct.length < 10) {
          _hasMore = false;
        }

        yield LoadedProductState(
          hasMore: _hasMore,
          listProduct: _listProduct,
        );
      } catch (e) {
        print("error");
        print(e);
      }
    }
  }

  refreshList() async {
    _listProduct.clear();
    try {
      List<ProductResponse> data = await productRepository.getListProduct(
        page: _page,
        isNew: _isNew,
        isHot: _isHot,
        limit: _limit,
        isSelling: _isSelling,
        categoryId: _categoryId,
        keyword: _keyword,
      );

      if (data.isNotEmpty) {
        _listProduct.addAll(data);
      } else {
        _hasMore = false;
      }

      if (_listProduct.length < 10) {
        _hasMore = false;
      }
      emit(LoadedProductState(
        hasMore: _hasMore,
        listProduct: _listProduct,
      ));
    } catch (e) {
      emit(state);
    }
  }
}
