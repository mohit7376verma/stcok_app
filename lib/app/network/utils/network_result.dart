import 'network_exception.dart';

class NetworkSuccess<T> extends NetworkResult<T> {
  final T data;

  const NetworkSuccess(this.data);
}

class NetworkError<T> extends NetworkResult<T> {
  final NetworkException error;

  const NetworkError(this.error);
}

sealed class NetworkResult<T> {
  const NetworkResult();

  const factory NetworkResult.success(T data) = NetworkSuccess;

  const factory NetworkResult.error(NetworkException error) = NetworkError;

  void when({
    required Function(T success) success,
    required Function(NetworkException error) error,
  }) {
    switch (this) {
      case NetworkSuccess _:
        final data = (this as NetworkSuccess<T>).data;
        success(data);
      case NetworkError _:
        final exception = (this as NetworkError<T>).error;
        error(exception);
    }
  }

  S map<S>({
    required S Function(NetworkSuccess<T> data) success,
    required S Function(NetworkError<T> error) error,
  }) {
    switch (this) {
      case NetworkSuccess _:
        return success(this as NetworkSuccess<T>);
      case NetworkError _:
        return error(this as NetworkError<T>);
    }
  }

  Future<S> mapAsync<S>({
    required Future<S> Function(NetworkSuccess<T> data) success,
    required Future<S> Function(NetworkError<T> error) error,
  }) {
    switch (this) {
      case NetworkSuccess _:
        return success(this as NetworkSuccess<T>);
      case NetworkError _:
        return error(this as NetworkError<T>);
    }
  }
}
