import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconMenu {
  final IconData iconName;
  final String titleIcon;
  IconMenu({this.iconName, this.titleIcon});
}

List<IconMenu> iconList = [
  IconMenu(iconName: Icons.ac_unit, titleIcon: "AC Unit"),
  IconMenu(iconName: Icons.access_alarm, titleIcon: "Alarm"),
  IconMenu(iconName: Icons.accessibility_new, titleIcon: "accessiblity"),
  IconMenu(iconName: Icons.add, titleIcon: "Add"),
];

class TypeUser extends StatefulWidget {
  static const routeName = "/testing-page";

  @override
  _TypeUserState createState() => _TypeUserState();
}

class _TypeUserState extends State<TypeUser> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            'Selecciona el tipo de usuario',
            style: GoogleFonts.nunitoSans(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff383D62),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    border: Border.all(
                      color:
                          selectedIndex == 1 ? Color(0xFF3369ff) : Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  width: 150.0,
                  height: 150.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.person_pin_circle,
                        size: 70.0,
                        color: selectedIndex == 1
                            ? Color(0xFF3369ff)
                            : Colors.grey,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Pasajero',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 1
                              ? Color(0xFF3369ff)
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    border: Border.all(
                      color:
                          selectedIndex == 2 ? Color(0xFF3369ff) : Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  width: 150.0,
                  height: 150.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.directions_car,
                        size: 70.0,
                        color: selectedIndex == 2
                            ? Color(0xFF3369ff)
                            : Colors.grey,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Conductor',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 2
                              ? Color(0xFF3369ff)
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .4,
          ),
          _crearBoton(context)
        ],
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return StreamBuilder<Object>(
      // stream: bloc.formValidStream,
      builder: (context, snapshot) {
        return RaisedButton(
          // onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          onPressed: () => _next(),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xff3369FF),
          disabledColor: Color(0xffBCCBF6),
          textColor: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              'Continuar',
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

  _next() {
    if (selectedIndex == 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}

// class _TypeUserState extends State<TypeUser> {
//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             height: 200,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: iconList.length,
//               itemBuilder: (BuildContext context, int position) {
//                 return InkWell(
//                   onTap: () => setState(() => selectedIndex = position),
//                   child: Container(
//                     width: 150,
//                     child: Card(
//                       shape: (selectedIndex == position)
//                           ? RoundedRectangleBorder(
//                               side: BorderSide(color: Colors.green))
//                           : null,
//                       elevation: 5,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           Icon(iconList[position].iconName),
//                           Text(iconList[position].titleIcon)
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
