import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class Authenticating extends AuthState {
  @override
  String toString() {
    return "Authenticating";
  }

  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  String toString() {
    return "AuthLoading";
  }

  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  @override
  String toString() {
    return "AuthSuccess";
  }

  @override
  List<Object?> get props => [];
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed({
    required this.error,
  });

  @override
  String toString() {
    return "AuthFailed";
  }

  @override
  List<Object?> get props => [];
}
