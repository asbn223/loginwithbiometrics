import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:letitgrow_login/widgets/custom_snackbar.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final LocalAuthentication _localAuthentication = LocalAuthentication();

  static Future<User?> login(String email, String password) async {
    final cred = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(cred..user);
    return cred.user;
  }

  static Future<User?> register(String email, String password) async {
    try {
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (error) {
      rethrow;
    }
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        user = userCredential.user;
        print(user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          showCustomSnackBar(context,
              message:
                  'The account already exists with a different credential.');
        } else if (e.code == 'invalid-credential') {
          showCustomSnackBar(context,
              message:
                  'Error occurred while accessing credentials. Try again.');
        }
      } catch (e) {
        showCustomSnackBar(context,
            message: 'Error occurred using Google Sign-In. Try again.');
      }
    }

    return user;
  }

  static Future<bool> checkBiometrics() async {
    try {
      return await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> loginWithBiometrics() async {
    final isAvailable = await checkBiometrics();
    if (!isAvailable) return false;

    try {
      return await _localAuthentication.authenticate(
        localizedReason: "Login With Finger Print",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      return false;
    }
  }
}
