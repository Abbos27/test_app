part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;

  const HomeState({
    this.status = Status.initial,
  });

  HomeState copyWith({
    Status? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
