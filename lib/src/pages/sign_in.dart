import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruta_u/src/bloc/provider.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
    return Scaffold(
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
                        _crearBoton()
                      ],
                    ),
                  ),
                ),
                // _iniciarSesion(),
                Icon(Icons.directions_car),
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
            Color.fromRGBO(255, 255, 255, 0.05),
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
          top: -135.0,
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

  Widget _crearBoton() {
    return RaisedButton(
      onPressed: null,
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
  }
}
