import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ruta_u/widgets/header.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: CustomScrollView(slivers: <Widget>[_crearAppBar(context)]),
      // ),

      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(250.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff3369FF),
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: GoogleFonts.nunitoSans(
                    fontSize: 24, fontStyle: FontStyle.normal),
                tabs: [
                  Tab(text: 'Iniciar sesión'),
                  Tab(text: 'Regístrate'),
                ],
              ),
              flexibleSpace: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    "Ruta U",
                    style: TextStyle(
                      fontFamily: "Cocogoose",
                      fontSize: 31,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _crearAppBar(BuildContext context) {
//   final _screenSize = MediaQuery.of(context).size;
//   return SliverAppBar(
//     backgroundColor: Color(0xff3369FF),
//     elevation: 2.0,
//     expandedHeight: _screenSize.height * 0.3,
//     // iconTheme: new IconThemeData(color: Colors.black),
//     floating: false,
//     pinned: true,
//     // actions: <Widget>[
//     //   IconButton(
//     //     icon: Icon(
//     //       Icons.share,
//     //       size: 20.0,
//     //     ),
//     //     color: Colors.black,
//     //     onPressed: () {},
//     //   ),
//     //   IconButton(
//     //     icon: Icon(
//     //       const IconData(0xe805, fontFamily: 'MyFlutterApp'),
//     //       size: 20.0,
//     //     ),
//     //     color: Colors.black,
//     //     onPressed: () {},
//     //   )
//     // ],
//     flexibleSpace: FlexibleSpaceBar(
//       title: Align(
//         alignment: Alignment.centerLeft,
//         // heightFactor: 250.0,
//         child: Text(
//           "Ruta U",
//           style: TextStyle(
//             fontFamily: "Cocogoose",
//             fontSize: 22,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.left,
//         ),
//       ),
//     ),
//   );
// }
