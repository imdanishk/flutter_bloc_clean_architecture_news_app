import 'package:dio/dio.dart';

// Abstract class representing the state of data, which can be either a success or a failure.
abstract class DataState<T> {
  final T? data;  // The data if the operation is successful.
  final DioError? error;  // The error if the operation fails.

  const DataState({this.data, this.error});
}

// Class representing a successful data state.
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);  // Constructor to initialize with data.
}

// Class representing a failed data state.
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(error: error);  // Constructor to initialize with error.
}
