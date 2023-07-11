enum Status {
  initial,
  loading,
  success,
  error,
}

extension StatusX on Status {
  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isInitial => this == Status.initial;

  bool get isError => this == Status.error;
}
