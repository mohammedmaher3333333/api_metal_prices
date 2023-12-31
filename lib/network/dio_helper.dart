import 'package:dio/dio.dart';
class DioHelper{
  static Dio? dio;

  static init(){
    dio=Dio(BaseOptions(baseUrl: 'https://www.goldapi.io/api/',receiveDataWhenStatusError: true)
    );
  }
  static Future <Response> getData(String url){
    dio!.options.headers= {'x-access-token': 'goldapi-13qbd6rlnc5hi4u-io'};
    return dio!.get(url);
  }
}