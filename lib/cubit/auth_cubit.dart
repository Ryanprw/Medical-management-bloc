import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/models/user_model.dart';
import 'package:login/service/auth_services.dart';
import 'package:login/service/user_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthServices().signIn(
        email: email,
        password: password,
      );
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String name,
      String city = ''}) async {
    try {
      emit(AuthLoading());
      //object
      UserModel user = await AuthServices()
          .signUp(email: email, password: password, name: name, city: city);

      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserServices().getUserById(id);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
