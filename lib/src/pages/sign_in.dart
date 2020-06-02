import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruta_u/src/bloc/provider.dart';
import 'package:ruta_u/src/bloc/provider_signup.dart';
import 'package:ruta_u/src/models/usuarioModel.dart';
import 'package:ruta_u/src/providers/usuario_provider.dart';
import 'package:ruta_u/src/utils/utils.dart';
import 'package:ruta_u/src/utils/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool loading = false;
  final authProvider = new AuthProvider();
  UserModel usuario = new UserModel();
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
    final bloc = Provider.of(context);
    final blocSignup = ProviderSignup.of(context);
    return loading
        ? Loading()
        : Scaffold(
            body: DefaultTabController(
              length: 2,
              child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: Color(0xff3369FF),
                        expandedHeight: size.height * 0.36,
                        floating: false,
                        elevation: 0,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          background: _crearFondo(context),
                        ),
                        bottom: TabBar(
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          indicatorWeight: 4.0,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: GoogleFonts.nunitoSans(
                              fontSize: 20, fontStyle: FontStyle.normal),
                          tabs: [
                            Tab(text: 'Iniciar sesión'),
                            Tab(text: 'Regístrate'),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 40.0),
                          child: Column(
                            children: <Widget>[
                              _crearEmail(bloc),
                              SizedBox(height: 20.0),
                              _crearPassword(bloc),
                              SizedBox(height: 20.0),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'Recuperar contraseña',
                                  style: TextStyle(
                                    color: Color(0xff3369FF),
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(height: 70.0),
                              _crearBoton(bloc)
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40.0, top: 40.0),
                            child: Column(
                              children: <Widget>[
                                _crearNombre(blocSignup),
                                SizedBox(height: 10.0),
                                _crearApellido(blocSignup),
                                SizedBox(height: 10.0),
                                _crearCelular(blocSignup),
                                SizedBox(height: 10.0),
                                _crearEmailSignup(blocSignup),
                                SizedBox(height: 10.0),
                                _crearPasswordSignup(blocSignup),
                                SizedBox(height: 30.0),
                                _crearCiudad(),
                                SizedBox(height: 20.0),
                                _crearUniversidad(),
                                SizedBox(height: 40.0),
                                _crearBotonSignUp(blocSignup)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoAzul = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          Color(0xff3369FF),
          Color(0xff205BFF),
        ],
      )),
    );
    final circulo = Container(
      height: 424,
      width: 424,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(255, 255, 255, 0.07),
            Color.fromRGBO(255, 255, 255, 0.01)
          ],
        ),
      ),
    );
    final textoLogo = Text(
      "Ruta U",
      style: TextStyle(
        fontFamily: "Cocogoose",
        fontSize: 31,
        color: Colors.white,
      ),
      textAlign: TextAlign.left,
    );
    return Stack(
      children: <Widget>[
        fondoAzul,
        Positioned(
          top: -140.0,
          left: 90.0,
          child: circulo,
        ),
        Positioned(
          left: 40.0,
          top: size.height * 0.15,
          child: textoLogo,
        )
      ],
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.nunitoSans(
            color: Color(0xff383D62),
            letterSpacing: 0.07,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'ejemplo@gmail.com',
            labelText: 'Correo',
            focusColor: Color(0xff3369FF),
            labelStyle: TextStyle(
              color: Color.fromRGBO(56, 61, 98, 0.6),
            ),
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          obscureText: true,
          style: GoogleFonts.nunitoSans(
            color: Color(0xff383D62),
            letterSpacing: 0.1,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: snapshot.error,
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              color: Color.fromRGBO(56, 61, 98, 0.6),
            ),
          ),
          onChanged: bloc.changePassword,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.formValidStream,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
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
              'Ingresar',
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

  _login(LoginBloc bloc, BuildContext context) async {
    final info = await authProvider.signInWithEmailAndPassword(
        bloc.email, bloc.password);
    if (info != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      mostrarAlerta(context, 'El correo y contraseña no son validos');
    }
  }

  _registrar(SignupBloc blocSignup, BuildContext context) async {
    if (!_formKey.currentState.validate()) return;
    loading = true;
    _formKey.currentState.save();
    final info = authProvider.registerWithEmailAndPassword(
        blocSignup.email, blocSignup.password, usuario);
    if (info != null) {
      Navigator.pushReplacementNamed(context, '/type_user');
    } else {
      mostrarAlerta(context, 'Datos invalidos');
      loading = false;
    }
  }

  //Registro
  Widget _crearNombre(SignupBloc blocSignup) {
    return StreamBuilder(
      stream: blocSignup.nameStream,
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
            hintText: "Dany Escobar",
            labelText: 'Nombres',
            focusColor: Color(0xff3369FF),
            labelStyle: TextStyle(
              color: Color.fromRGBO(56, 61, 98, 0.6),
            ),
          ),
          onSaved: (value) => usuario.nombre = value,
          onChanged: blocSignup.changeName,
        );
      },
    );
  }

  Widget _crearApellido(SignupBloc blocSignup) {
    return StreamBuilder(
      stream: blocSignup.lastNameStream,
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
              hintText: "Escobar Parrado",
              labelText: 'Apellido',
              focusColor: Color(0xff3369FF),
              labelStyle: TextStyle(
                color: Color.fromRGBO(56, 61, 98, 0.6),
              ),
            ),
            onSaved: (value) => usuario.apellido = value,
            onChanged: blocSignup.changeLastName);
      },
    );
  }

  Widget _crearCelular(SignupBloc blocSignup) {
    return StreamBuilder(
      stream: blocSignup.celularStream,
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
              hintText: "3123432500",
              labelText: 'Celular',
              focusColor: Color(0xff3369FF),
              labelStyle: TextStyle(
                color: Color.fromRGBO(56, 61, 98, 0.6),
              ),
            ),
            onSaved: (value) => usuario.celular = value,
            onChanged: blocSignup.changeCelular);
      },
    );
  }

  Widget _crearEmailSignup(SignupBloc blocSignup) {
    return StreamBuilder(
      stream: blocSignup.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          initialValue: usuario.correo,
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.nunitoSans(
            color: Color(0xff383D62),
            letterSpacing: 0.07,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'ejemplo@gmail.com',
            labelText: 'Correo',
            focusColor: Color(0xff3369FF),
            labelStyle: TextStyle(
              color: Color.fromRGBO(56, 61, 98, 0.6),
            ),
          ),
          onSaved: (value) => usuario.correo = value,
          onChanged: blocSignup.changeEmail,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _crearPasswordSignup(SignupBloc blocSignup) {
    return StreamBuilder(
      stream: blocSignup.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          initialValue: usuario.password,
          obscureText: true,
          style: GoogleFonts.nunitoSans(
            color: Color(0xff383D62),
            letterSpacing: 0.1,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: snapshot.error,
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              color: Color.fromRGBO(56, 61, 98, 0.6),
            ),
          ),
          onSaved: (value) => usuario.password = value,
          onChanged: blocSignup.changePassword,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        );
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

  Widget _crearBotonSignUp(SignupBloc blocSignup) {
    return StreamBuilder<Object>(
      stream: blocSignup.formValidStream,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed:
              snapshot.hasData ? () => _registrar(blocSignup, context) : null,
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
              'Registrate',
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

  _submit(SignupBloc blocSignup, BuildContext context) {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    print(usuario.nombre);
    print(usuario.apellido);
    print(usuario.ciudad);
    print(usuario.correo);
    print(usuario.celular);
    print(usuario.password);
    print(usuario.universidad);
    // print( selectedCiudad.nombre );
    // print( selectedCiudad.id );
  }
}
