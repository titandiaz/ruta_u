import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruta_u/src/bloc/provider.dart';
import 'package:ruta_u/src/bloc/provider_signup.dart';
import 'package:ruta_u/src/pages/home_page.dart';
import 'package:ruta_u/src/pages/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderSignup(
      child: Provider(
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
          initialRoute: '/sign_in',
          routes: {
            '/sign_in': (BuildContext context) => SignIn(),
            '/home': (BuildContext context) => HomePage(),
          },
        ),
      ),
    );
  }
}
