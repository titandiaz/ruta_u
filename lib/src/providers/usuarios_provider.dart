import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioProvider {
  final CollectionReference _dataUsuarios =
      Firestore.instance.collection("usuarios");

  // crearUsuario(UsuarioModel usuario) {

  // }
}
