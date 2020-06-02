import 'package:flutter/material.dart';
import 'package:ruta_u/src/bloc/edit_profile_bloc.dart';
export 'package:ruta_u/src/bloc/edit_profile_bloc.dart';

class ProviderEditProfile extends InheritedWidget {
  static ProviderEditProfile _instancia;

  factory ProviderEditProfile({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderEditProfile._internal(key: key, child: child);
    }

    return _instancia;
  }

  ProviderEditProfile._internal({Key key, Widget child}) : super(key: key, child: child);

  final editProfile = EditProfileBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static EditProfileBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProviderEditProfile) as ProviderEditProfile)
        .editProfile;
  }
}