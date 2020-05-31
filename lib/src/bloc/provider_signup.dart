import 'package:flutter/material.dart';
import 'package:ruta_u/src/bloc/signup_bloc.dart';
export 'package:ruta_u/src/bloc/signup_bloc.dart';

class ProviderSignup extends InheritedWidget {
  static ProviderSignup _instancia;

  factory ProviderSignup({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderSignup._internal(key: key, child: child);
    }

    return _instancia;
  }

  ProviderSignup._internal({Key key, Widget child}) : super(key: key, child: child);

  final signupBloc = SignupBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SignupBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProviderSignup) as ProviderSignup)
        .signupBloc;
  }
}