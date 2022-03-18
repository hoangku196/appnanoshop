import 'package:nanoshop_app/app/utils/models/product_response.dart';

class ProductState {}

class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final List<ProductResponse> listProduct;
  final bool hasMore;

  LoadedProductState({
    required this.listProduct,
    required this.hasMore,
  });
}
