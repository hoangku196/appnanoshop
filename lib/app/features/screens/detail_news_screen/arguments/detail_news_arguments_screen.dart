import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/logic/blocs/news_bloc/news_bloc.dart';

class DetailNewArgumentScreen {
  final dynamic model;
  final NewsBloc bloc;
  final int page;

  DetailNewArgumentScreen({
    this.model,
    required this.bloc,
    required this.page,
  });
}
