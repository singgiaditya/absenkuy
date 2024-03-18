import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;

  Future<Map<String, dynamic>> login(String email, String pass) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);

      return {
        "error": false,
        "message": "Berhasil login.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    } catch (e) {
      // Error general
      return {
        "error": true,
        "message": "Tidak dapat login.",
      };
    }
  }

  Future<Map<String, dynamic>> logout() async {
    try {
      await _firebaseAuth.signOut();

      return {
        "error": false,
        "message": "Berhasil logout.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    } catch (e) {
      // Error general
      return {
        "error": true,
        "message": "Tidak dapat logout.",
      };
    }
  }

  @override
  void onInit() {
    _firebaseAuth.authStateChanges().listen((event) { user = event;});

    super.onInit();
  }
}
