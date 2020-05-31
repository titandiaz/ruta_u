import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:ruta_u/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc with Validators {
  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _celularController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get nameStream =>
      _nameController.stream.transform(validarName);
  Stream<String> get lastNameStream =>
      _lastNameController.stream.transform(validarName);
  Stream<String> get celularStream =>
      _celularController.stream.transform(validarName);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);


  Stream<bool> get formValidStream =>
      CombineLatestStream.combine5(nameStream, lastNameStream, celularStream, emailStream, passwordStream, (e, p, c, b, a) => true);

  // Insertar valores al Stream
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeCelular => _celularController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el último valor ingresado a los streams
  String get name => _nameController.value;
  String get lastName => _lastNameController.value;
  String get celular => _celularController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _nameController?.close();
    _lastNameController?.close();
    _celularController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
