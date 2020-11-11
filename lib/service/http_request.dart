import 'package:dio/dio.dart';
import './config.dart';


class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL,connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);
  static Future<T> request<T>(String url,{
                      method = 'get',
                      Map<String,dynamic> params,
                      Interceptor inter}) async {
    final options = Options(method: method);

    //interceptors
    Interceptor dIter = InterceptorsWrapper(
      onRequest: (options) {
        print('request inter');
        return options;
      },
      onResponse: (options) {
        print('response inter');
        return options;
      },
      onError: (err) {
        print('error inter');
        return err;
      }
    );
    List<Interceptor> inters = [dIter];

    if(inter != null) {
        inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    try {
      Response response = await dio.request(
          url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }


  }
}