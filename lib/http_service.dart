import 'package:dio/dio.dart';

class HttpService{
  var _dio = Dio();

  final baseUrl = 'https://reqres.in/';

   

  HttpServices (){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl));
      // initializeInterceptors();
  }
   
  Future<Response>getResponse(String endPoint) async {
    _dio.get(endPoint);
    Response response;

    try {
      response = await getResponse(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  // initializeInterceptors(){
  //   _dio.interceptors.add(InterceptorsWrapper(
  //     onError:(error){
  //       print(error.message);
  //       },
  //     onRequest: (request){
  //       print(${request.method}${request.path})
  //       },
  //     onResponse: (response){
  //       print(response.data)
  //       } 
  //   ))
  }

// }