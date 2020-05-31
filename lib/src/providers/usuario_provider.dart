import 'dart:convert';
import 'package:ruta_u/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruta_u/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:ruta_u/src/providers/database.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _prefs = new PreferenciasUsuario();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //logearse
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      _prefs.token = user.uid;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Registrar
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      _prefs.token = user.uid;

      await DatabaseService(uid: user.uid)
          .updateUserData(email, 'prueba', 'Santo thomas', 'urlPhoto');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
