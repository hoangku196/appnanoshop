
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';

final List dummyImage = [
  DummyImage(url: AssetsPath.dummyImage),
  DummyImage(url: AssetsPath.dummyImage),
  DummyImage(url: AssetsPath.dummyImage),
  DummyImage(url: AssetsPath.dummyImage),
  DummyImage(url: AssetsPath.dummyImage),
  DummyImage(url: AssetsPath.dummyImage),
  DummyImage(url: AssetsPath.dummyImage),
];

class DummyImage {
  final String url;

  DummyImage({
    required this.url,
  });
}
