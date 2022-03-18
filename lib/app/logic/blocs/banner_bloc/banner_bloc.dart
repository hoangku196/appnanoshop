import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/logic/event/banner_event/banner_event.dart';
import 'package:nanoshop_app/app/logic/state/banner_state/banner_state.dart';
import 'package:nanoshop_app/app/utils/repository/banner_respository/banner_repository.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  final String _groupId = "1";

  BannerBloc({
    required this.bannerRepository,
  }) : super(BannerState());

  @override
  Stream<BannerState> mapEventToState(BannerEvent event) async* {
    yield LoadingBanner();
    await Future.delayed(Duration(seconds: 4));
    try {
      List<String> _listImageSrc =
      await bannerRepository.getBanner(groupId: _groupId);
      yield LoadedBanner(images: _listImageSrc);
    } catch (e) {
      yield LoadedFailureBanner();
    }
  }

  refreshBanner() async {
    // List<String> _listImageSrc = [
    //   "sadsad",
    //   "sadsad",
    //   "sadsad",
    //   "sadsad",
    // ];
    try {
      List<String> _listImageSrc =
      await bannerRepository.getBanner(groupId: _groupId);
      emit(
        LoadedBanner(images: _listImageSrc),
      );
    } catch (e) {
      emit(state);
    }
  }
}
