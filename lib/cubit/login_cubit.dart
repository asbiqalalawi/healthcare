import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var dio = Dio();

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());

      await dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': email,
          'password': password,
        },
      ).then((value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value.data['token']);
      });

      emit(LoginSuccess());
    } on DioError catch (e) {
      emit(LoginFailed(error: e.response!.data['error'].toString()));
    } catch (e) {
      emit(LoginFailed(error: e.toString()));
    }
  }
}
