part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadingApiEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class NoInternetEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
