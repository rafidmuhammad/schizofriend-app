import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ta_schizo/models/user_model.dart';
import 'package:ta_schizo/services/user_service.dart';

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<bool> isLoggedIn() async => await googleSignIn.isSignedIn();

  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    User? firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    UserModel user = await UserService().settingUp(
        firebaseUser!.uid, firebaseUser.displayName, firebaseUser.photoURL);
    return user;
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.disconnect();
      await googleSignIn.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
