import 'package:dio/dio.dart';

class HttpService{
  var _dio = Dio();

  static const baseUrl = 'https://reqres.in/';

   

  HttpServices (){
    _dio = Dio(BaseOptions(
      // baseUrl: baseUrl
      ));
      initializeInterceptors();
  }
   
  Future<Response>getResponse(String endPoint) async {
    // _dio.get(endPoint);
    Response response;
    Uri url = Uri.parse(baseUrl + endPoint);

    try {
      response = await _dio.get(baseUrl + endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError:(DioError error,ErrorInterceptorHandler handler){
        print(error.message);
        },
      onRequest: (RequestOptions options,RequestInterceptorHandler handler){
        print(options.method+ " "  + options.path);
        },
      onResponse: (Response response, ResponseInterceptorHandler handler){
        print(response.data);
        } 
    ));
  }
  }

