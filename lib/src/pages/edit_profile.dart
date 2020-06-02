import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruta_u/src/bloc/provider_edit_profile.dart';
import 'package:ruta_u/src/models/usuarioModel.dart';
import 'package:ruta_u/src/providers/usuario_provider.dart';
import 'package:ruta_u/src/utils/utils.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModel usuario = new UserModel();
  final authProvider = new AuthProvider();
  Ciudad selectedCiudad;
  List<Ciudad> ciudades = <Ciudad>[
    Ciudad(
        id: 1,
        nombre: 'Villavicencio',
        departamento: Departamento(id: 1, nombre: 'Meta')),
    Ciudad(
        id: 2,
        nombre: 'Bogota',
        departamento: Departamento(id: 2, nombre: 'Cundinamarca'))
  ];

  Universidad selectedUniversidad;
  List<Universidad> universidades = <Universidad>[
    Universidad(
        id: 1, nombre: 'Universidad Cooperativa', logo: 'img1', sede: 1),
    Universidad(id: 2, nombre: 'Santo Tomas', logo: 'img2', sede: 2)
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final blocEditProfile = ProviderEditProfile.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3369FF),
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/user_profile'),
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            // Your widgets here
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    transform: Matrix4.translationValues(-35.0, 0.0, 0.0),
                    child: Center(
                        child: Text(
                      'Editar perfil',
                      style: GoogleFonts.nunitoSans(
                        letterSpacing: 0.07,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ))),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
            child: Column(
              children: <Widget>[
                _crearNombre(blocEditProfile),
                SizedBox(height: 10.0),
                _crearApellido(blocEditProfile),
                SizedBox(height: 10.0),
                _crearCelular(blocEditProfile),
                SizedBox(height: 30.0),
                _crearDireccion(blocEditProfile),
                SizedBox(height: 30.0),
                _crearCiudad(),
                SizedBox(height: 20.0),
                _crearUniversidad(),
                SizedBox(height: 40.0),
                _crearBotonSignUp(blocEditProfile)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _registrar(EditProfileBloc blocEditProfile, BuildContext context) async {
  //   final info = authProvider.registerWithEmailAndPassword(
  //       blocEditProfile.email, blocEditProfile.password);
  //   if (info != null) {
  //     Navigator.pushReplacementNamed(context, '/home');
  //   } else {
  //     mostrarAlerta(context, 'Datos invalidos');
  //   }
  // }

  //Registro
  Widget _crearNombre(EditProfileBloc blocEditProfile) {
    return StreamBuilder(
      stream: blocEditProfile.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          initialValue: usuario.nombre,
          autofocus: true,
          style: GoogleFonts.nunitoSans(
            color: Color(0xff383D62),
            letterSpacing: 0.07,
            fontSize: 18,
          ),
          inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: usuario.nombre,
            labelText: 'Nombres',
            focusColor: Color(0xff3369FF),
            labelStyle: TextStyle(
              color: Color.fromRGBO(56, 61, 98, 0.6),
            ),
          ),
          onSaved: (value) => usuario.nombre = value,
          onChanged: blocEditProfile.changeName,
        );
      },
    );
  }

  Widget _crearApellido(EditProfileBloc blocEditProfile) {
    return StreamBuilder(
      stream: blocEditProfile.lastNameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
            initialValue: usuario.apellido,
            style: GoogleFonts.nunitoSans(
              color: Color(0xff383D62),
              letterSpacing: 0.07,
              fontSize: 18,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))
            ],
            decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: usuario.apellido,
              labelText: 'Apellido',
              focusColor: Color(0xff3369FF),
              labelStyle: TextStyle(
                color: Color.fromRGBO(56, 61, 98, 0.6),
              ),
            ),
            onSaved: (value) => usuario.apellido = value,
            onChanged: blocEditProfile.changeLastName);
      },
    );
  }

  Widget _crearCelular(EditProfileBloc blocEditProfile) {
    return StreamBuilder(
      stream: blocEditProfile.celularStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
            initialValue: usuario.celular,
            style: GoogleFonts.nunitoSans(
              color: Color(0xff383D62),
              letterSpacing: 0.07,
              fontSize: 18,
            ),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: usuario.celular,
              labelText: 'Celular',
              focusColor: Color(0xff3369FF),
              labelStyle: TextStyle(
                color: Color.fromRGBO(56, 61, 98, 0.6),
              ),
            ),
            onSaved: (value) => usuario.celular = value,
            onChanged: blocEditProfile.changeCelular);
      },
    );
  }

  Widget _crearCiudad() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Center(
        child: Container(
          width: 350.0,
          child: DropdownButton<Ciudad>(
            // elevation: 0,
            style: GoogleFonts.nunitoSans(
              color: Color(0xff383D62),
              letterSpacing: 0.07,
              fontSize: 18,
            ),
            hint: Text("Ciudad"),
            value: selectedCiudad,
            onChanged: (Ciudad newValue) {
              setState(() {
                selectedCiudad = newValue;
                usuario.ciudad = newValue;
              });
            },
            items: ciudades.map((Ciudad ciudad) {
              return DropdownMenuItem<Ciudad>(
                value: ciudad,
                child: Text(
                  ciudad.nombre,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _crearUniversidad() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Center(
        child: Container(
          width: 350.0,
          child: DropdownButton<Universidad>(
            // elevation: 0,
            style: GoogleFonts.nunitoSans(
              color: Color(0xff383D62),
              letterSpacing: 0.07,
              fontSize: 18,
            ),
            hint: Text("Universidad"),
            value: selectedUniversidad,
            onChanged: (Universidad newValue) {
              setState(() {
                selectedUniversidad = newValue;
                usuario.universidad = newValue;
              });
            },
            items: universidades.map((Universidad universidad) {
              return DropdownMenuItem<Universidad>(
                value: universidad,
                child: Text(
                  universidad.nombre,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _crearDireccion(EditProfileBloc blocEditProfile) {
    return StreamBuilder(
      stream: blocEditProfile.direccionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
            // initialValue: usuario.direccion,
            style: GoogleFonts.nunitoSans(
              color: Color(0xff383D62),
              letterSpacing: 0.07,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: 'Manzana 6 casa 17',
              labelText: 'Dirección',
              focusColor: Color(0xff3369FF),
              labelStyle: TextStyle(
                color: Color.fromRGBO(56, 61, 98, 0.6),
              ),
            ),
            // onSaved: (value) => usuario.direccion = value,
            onChanged: blocEditProfile.changeDireccion);
      },
    );
  }

  Widget _crearBotonSignUp(EditProfileBloc blocEditProfile) {
    return StreamBuilder<Object>(
      stream: blocEditProfile.formValidStream,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed:
              snapshot.hasData ? () => _submit(blocEditProfile, context) : null,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xff3369FF),
          disabledColor: Color(0xffBCCBF6),
          textColor: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            width: double.infinity,
            child: Text(
              'Guardar',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                letterSpacing: 0.1,
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }

  _submit(EditProfileBloc blocEditProfile, BuildContext context) {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/user_profile');

    print(usuario.nombre);
    print(usuario.apellido);
    print(usuario.ciudad);
    print(usuario.celular);
    print(usuario.universidad);
    // print( selectedCiudad.nombre );
    // print( selectedCiudad.id );
  }
}
