import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class Authentication extends AuthEvent{
  @override
  String toString() {
    return "Authentication";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
