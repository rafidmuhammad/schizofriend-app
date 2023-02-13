import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_schizo/models/user_model.dart';
import 'package:ta_schizo/services/auth_service.dart';
import 'package:ta_schizo/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SharedPreferences preferences;
  AuthCubit({required this.preferences}) : super(AuthInitial());

  String? getValue(String key) {
    return preferences.getString(key);
  }

  Future<bool> isSignedIn() async {
    return await AuthService().isLoggedIn();
  }

  void signInWithGoogle() async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signInWithGoogle();
      preferences.setString("username", user.username!);
      preferences.setString("userId", user.id);
      preferences.setString("imageUrl", user.imageUrl!);
      emit(AuthSuccess(user));
    } on FirebaseException catch (e) {
      throw AuthFailed(e.toString());
    }
  }

  void updateData(String id, Map<String, String> dataNeedUpdate) async {
    await UserService().updateDataFirestore(id, dataNeedUpdate);
  }

  void getUserDataByID(String id) async {
    try {
      emit(AuthLoading());
      UserModel user = await UserService().fetchUserDataById(id);
      preferences.setString("username", user.username!);
      // preferences.setString("imageUrl", user.imageUrl!);
      emit(AuthSuccess(user));
    } catch (e) {
      throw AuthFailed(e.toString());
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
}
