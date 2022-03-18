class BannerState {}

class LoadingBanner extends BannerState {}

class LoadedBanner extends BannerState {
  final List<String> images;

  LoadedBanner({
    required this.images,
  });
}

class LoadedFailureBanner extends BannerState {}
