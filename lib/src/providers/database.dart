import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersColletion =
      Firestore.instance.collection('usuarios');

  Future updateUserData(
    String correo,
    String nombre,
    String universidad,
    String foto,
  ) async {
    return await usersColletion.document(uid).setData({
      'correo': correo,
      'nombre': nombre,
      'universidad': universidad,
      'foto': foto
    });
  }
}
