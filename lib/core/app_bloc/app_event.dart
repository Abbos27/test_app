part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class LoadEvent extends AppEvent {
  const LoadEvent();

  @override
  List<Object?> get props => [];
}


