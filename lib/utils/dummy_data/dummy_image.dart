import 'package:nanoshop_app/utils/assets_source/assets_source.dart';

final List dummyImage = [
  DummyImage(url: AssetsSource.dummyImage),
  DummyImage(url: AssetsSource.dummyImage),
  DummyImage(url: AssetsSource.dummyImage),
  DummyImage(url: AssetsSource.dummyImage),
  DummyImage(url: AssetsSource.dummyImage),
  DummyImage(url: AssetsSource.dummyImage),
  DummyImage(url: AssetsSource.dummyImage),
];

class DummyImage {
  final String url;

  DummyImage({
    required this.url,
  });
}
