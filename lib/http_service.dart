import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  String baseUrl = "https://api-tasnif.soliq.uz/cl-api/mxik/";

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler) {
        print(error.message);
      },
      onRequest: (request, errorInterceptorHandler) {
        print("${request.method} ${request.path}");
      },
      onResponse: (response, errorInterceptorHandler) {
        print(response.data);
      },
    ));
  }
}
