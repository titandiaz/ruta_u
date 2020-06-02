import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruta_u/src/models/usuarioModel.dart';
import 'package:ruta_u/src/pages/type_user.dart';

class DatabaseService extends UserModel {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersColletion =
      Firestore.instance.collection('usuarios');

  // Future updateUserData(
  //   String correo,
  //   String nombre,
  //   String universidad,
  //   String foto,
  // ) async {
  //   return await usersColletion.document(uid).setData({
  //     'correo': correo,
  //     'nombre': nombre,
  //     'universidad': universidad,
  //     'foto': foto
  //   });
  // }

  // final user = UserModel(usuario);

  Future updateUserData(UserModel usuario) async {
    return await usersColletion.document(uid).setData(usuario.toJson());
  }

  Future updateTypeUser(Type usuario) async {
    return await usersColletion.document(uid).updateData(type.toJson());
  }
}
