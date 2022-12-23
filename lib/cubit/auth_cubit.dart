import 'package:bloc/bloc.dart';
import 'package:e_school/models/user_model.dart';
import 'package:e_school/services/auth_service.dart';
import 'package:e_school/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn(
      {required String email,
      required String nisn,
      required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signIn(email: email, nisn: nisn, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp(
      {required String name,
      required String email,
      required String nisn,
      required String password}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService()
          .signUp(name: name, email: email, nisn: nisn, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
