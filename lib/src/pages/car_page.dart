import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruta_u/src/models/usuarioModel.dart';


class CarPage extends StatefulWidget {

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  Type type = new Type();
  Carro carro = new Carro();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/initial_map'),
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            // Your widgets here
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       transform: Matrix4.translationValues(-35.0, 0.0, 0.0),
            //       child: Center(child: Text('Datos de tu vehículo',
            //         style: GoogleFonts.nunitoSans(
            //           letterSpacing: 0.07,
            //           fontSize: 22,
            //           color: Colors.black,
            //         ),
            //         textAlign: TextAlign.left,
            //         )
            //       )
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
            left: 40.0, right: 40.0, top: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text('Datos de tu vehículo',
                  style: GoogleFonts.nunitoSans(
                        letterSpacing: 0.07,
                        fontSize: 24,
                        color: Color(0xFF383D62),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 30.0),
                _crearMarca(),
                SizedBox(height: 10.0),
                _crearModelo(),
                SizedBox(height: 10.0),
                _crearPlaca(),
                SizedBox(height: 10.0),
                _crearColor(),
                SizedBox(height: 90.0),
                _crearBotonSignUp()
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
  Widget _crearMarca() {
    return TextFormField(
      initialValue: carro.marca,
      autofocus: true,
      style: GoogleFonts.nunitoSans(
        color: Color(0xff383D62),
        letterSpacing: 0.07,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: carro.marca,
        labelText: 'Marca',
        focusColor: Color(0xff3369FF),
        labelStyle: TextStyle(
          color: Color.fromRGBO(56, 61, 98, 0.6),
        ),
      ),
      onSaved: (value) => carro.marca = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa el campo';
        }
        return null;
      },
    );
  }

  Widget _crearModelo() {
    return TextFormField(
      initialValue: carro.modelo,
      autofocus: true,
      style: GoogleFonts.nunitoSans(
        color: Color(0xff383D62),
        letterSpacing: 0.07,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: carro.modelo,
        labelText: 'Modelo',
        focusColor: Color(0xff3369FF),
        labelStyle: TextStyle(
          color: Color.fromRGBO(56, 61, 98, 0.6),
        ),
      ),
      onSaved: (value) => carro.modelo = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa el campo';
        }
        return null;
      },
    );
  }
  Widget _crearPlaca() {
    return TextFormField(
      initialValue: carro.placa,
      autofocus: true,
      style: GoogleFonts.nunitoSans(
        color: Color(0xff383D62),
        letterSpacing: 0.07,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: carro.placa,
        labelText: 'Placa',
        focusColor: Color(0xff3369FF),
        labelStyle: TextStyle(
          color: Color.fromRGBO(56, 61, 98, 0.6),
        ),
      ),
      onSaved: (value) => carro.placa = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa el campo';
        }
        return null;
      },
    );
  }
  Widget _crearColor() {
    return TextFormField(
      initialValue: carro.color,
      autofocus: true,
      style: GoogleFonts.nunitoSans(
        color: Color(0xff383D62),
        letterSpacing: 0.07,
        fontSize: 18,
      ),
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
      decoration: InputDecoration(
        hintText: carro.color,
        labelText: 'Color',
        focusColor: Color(0xff3369FF),
        labelStyle: TextStyle(
          color: Color.fromRGBO(56, 61, 98, 0.6),
        ),
      ),
      onSaved: (value) => carro.color = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa el campo';
        }
        return null;
      },
    );
  }


  Widget _crearBotonSignUp() {
        return RaisedButton(
          onPressed: _submit,
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
              'Aceptar',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                letterSpacing: 0.1,
                fontSize: 18,
              ),
            ),
          ),
        );
  }

  void _submit() {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    print(carro.marca);
    print(carro.modelo);
    print(carro.placa);
    print(carro.color);
  }
}
