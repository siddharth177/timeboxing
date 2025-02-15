import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var firebaseAuthInstance = FirebaseAuth.instance;
var firestoreInstance = FirebaseFirestore.instance;

class ForgotPasswordNotifier extends StateNotifier<bool> {
  ForgotPasswordNotifier() : super(false);

  void updateForgotPasswordProvider(bool newVal) {
    state = newVal;
  }
}

final isForgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, bool>((ref) {
  return ForgotPasswordNotifier();
});

class LoginNotifier extends StateNotifier<bool> {
  LoginNotifier() : super(true);

  void updateLoginFlag(bool newVal) {
    state = newVal;
  }
}

final isLoginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) {
  return LoginNotifier();
});
