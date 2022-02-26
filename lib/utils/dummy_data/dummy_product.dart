import 'package:equatable/equatable.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';

final List dummyProduct = [
  DummyProduct(
    id: 1,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: true,
    percentSale: 20,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 2,
    title: 'Dịch vụ làm đẹp Dịch vụ làm đẹp Dịch vụ làm đẹpDịch vụ làm đẹpDịch vụ làm đẹpDịch vụ làm đẹpDịch vụ làm đẹpDịch vụ làm đẹp Dịch vụ làm đẹp Dịch vụ làm đẹpDịch vụ làm đẹpDịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 12,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 3,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 6,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 4,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: true,
    percentSale: 20,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 5,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: true,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 6,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 20,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 7,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: true,
    percentSale: 15,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 8,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 20,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 9,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: true,
    percentSale: 10,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 10,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 11,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 12,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 13,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 14,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 15,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
  DummyProduct(
    id: 16,
    title: 'Dịch vụ làm đẹp',
    url: AssetsSource.dummyImage,
    isFavourite: false,
    percentSale: 5,
    price: 100000,
    priceSale: 1200000,
  ),
];

class DummyProduct {
  final int id;
  final String title;
  final String url;
  final bool isFavourite;
  final int percentSale;
  final int price;
  final int priceSale;

  DummyProduct({
    required this.id,
    required this.title,
    required this.url,
    required this.isFavourite,
    required this.percentSale,
    required this.price,
    required this.priceSale,
  });
}
