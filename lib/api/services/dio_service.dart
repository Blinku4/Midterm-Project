import 'package:dio/dio.dart';
import '../api_constants.dart';

class DioClient{
  final Dio dio;

  DioClient() : dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    )
  );
}