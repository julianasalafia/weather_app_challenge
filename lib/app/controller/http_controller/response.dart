class Response<T> {
  final T? data;
  final int? statusCode;

  const Response({required this.data, required this.statusCode});
}
