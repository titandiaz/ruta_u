import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruta_u/src/bloc/provider.dart';
import 'package:ruta_u/src/pages/home_page.dart';
import 'package:ruta_u/src/pages/sign_in.dart';
import 'package:ruta_u/src/pages/type_user.dart';
import 'package:ruta_u/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ruta U',
        theme: ThemeData(
          primaryColor: Color(0xff3369FF),
          textTheme: TextTheme(
            bodyText1: GoogleFonts.nunitoSans(
                fontSize: 14, fontStyle: FontStyle.normal),
          ),
        ),
        initialRoute: '/type_user',
        routes: {
          '/sign_in': (BuildContext context) => SignIn(),
          '/home': (BuildContext context) => HomePage(),
          '/type_user': (BuildContext context) => TypeUser(),
        },
      ),
    );
  }
}
