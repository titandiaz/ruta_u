import 'package:flutter/material.dart';
import 'package:ruta_u/src/bloc/provider_signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocSignup = ProviderSignup.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${blocSignup.email}'),
          Divider(),
          Text('Password: ${blocSignup.password}'),
        ],
      ),
    );
  }
}
