import 'package:dio/dio.dart';
import '../dio/dio_env.dart';

class DioRequest {
  AppInterceptor appInterceptor = AppInterceptor();

  Future<Response> login(Map<String, dynamic> data) async {
    try {
      Response response =
          await appInterceptor.dio.post('/Auth/Login', data: data);
      return response;
    } on DioException catch (e) {
      return Future.error(e.response!.data['message']);
    } catch (e) {
      return Future.error('Sunucu Bakımda Lütfen Daha Sonra Tekrar Deneyiniz');
    }
  }
}
