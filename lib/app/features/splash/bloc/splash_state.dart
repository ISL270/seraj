part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashLoading extends SplashState {}

final class SplashSuccess extends SplashState {}

final class SplashFailure extends SplashState {}
