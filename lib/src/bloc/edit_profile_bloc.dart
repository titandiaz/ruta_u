import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:ruta_u/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class EditProfileBloc with Validators {
  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _celularController = BehaviorSubject<String>();
  final _direccionController = BehaviorSubject<String>();

  Stream<String> get nameStream =>
      _nameController.stream.transform(validarName);
  Stream<String> get lastNameStream =>
      _lastNameController.stream.transform(validarName);
  Stream<String> get celularStream =>
      _celularController.stream.transform(validarName);
  Stream<String> get direccionStream =>
      _direccionController.stream.transform(validarName);



  Stream<bool> get formValidStream =>
      CombineLatestStream.combine4(nameStream, lastNameStream, celularStream, direccionStream, (e, p, c, b) => true);

  // Insertar valores al Stream
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeCelular => _celularController.sink.add;
  Function(String) get changeDireccion => _direccionController.sink.add;

  //Obtener el último valor ingresado a los streams
  String get name => _nameController.value;
  String get lastName => _lastNameController.value;
  String get celular => _celularController.value;
  String get direccion => _direccionController.value;

  dispose() {
    _nameController?.close();
    _lastNameController?.close();
    _celularController?.close();
    _direccionController?.close();
  }
}
