import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ta_schizo/models/user_model.dart';
import 'package:ta_schizo/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signInWithGoogle() async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signInWithGoogle();
      emit(AuthSuccess(user));
    } on FirebaseException catch (e) {
      throw AuthFailed(e.toString());
    }
  }
}
