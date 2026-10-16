sealed class Result<T> {
  const Result();

  bool get isSuccess;
  bool get isFailure;
  T? get dataOrNull;
  String? get errorOrNull;

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(String message, Object? exception) onFailure,
  });
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  bool get isSuccess => true;

  @override
  bool get isFailure => false;

  @override
  T? get dataOrNull => data;

  @override
  String? get errorOrNull => null;

  @override
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(String message, Object? exception) onFailure,
  }) => onSuccess(data);
}

final class Failure<T> extends Result<T> {
  final String message;
  final Object? exception;
  const Failure(this.message, [this.exception]);

  @override
  bool get isSuccess => false;

  @override
  bool get isFailure => true;

  @override
  T? get dataOrNull => null;

  @override
  String? get errorOrNull => message;

  @override
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(String message, Object? exception) onFailure,
  }) => onFailure(message, exception);
}

typedef Another<T> = Result<T>;
