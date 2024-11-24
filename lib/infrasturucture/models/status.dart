enum Status {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;

  T maybeMap<T>({
    required T Function() orElse,
     T Function()? onInitial,
     T Function()? onLoading,
     T Function()? onSuccess,
     T Function()? onError,
  }) {
    return switch (this) {
      Status.initial => onInitial?.call() ?? orElse(),
      Status.loading => onLoading?.call() ?? orElse(),
      Status.success => onSuccess?.call() ?? orElse(),
      Status.error => onError?.call() ?? orElse(),
    };
  }
}
