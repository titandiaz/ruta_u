import 'dart:convert';
import 'package:ruta_u/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruta_u/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:ruta_u/src/providers/database.dart';
import 'package:ruta_u/src/models/usuarioModel.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _prefs = new PreferenciasUsuario();
  var currentUser;

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
      currentUser = user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Registrar
  Future registerWithEmailAndPassword(
      String email, String password, UserModel usuario) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      _prefs.token = user.uid;
      currentUser = user;
      await DatabaseService(uid: user.uid).updateUserData(usuario); //valores
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateInfoTypeUser(Type typeUser) async {
    try {
      await DatabaseService(uid: _prefs.token)
          .updateTypeUser(typeUser); //valores
      return _userFromFirebaseUser(currentUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
