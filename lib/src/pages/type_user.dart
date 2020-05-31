import 'package:flutter/material.dart';

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
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('seleccionar tipo de usuario'),
          Row(
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  width: 90.0,
                  height: 90.0,
                  child: Icon(Icons.error),
                ),
              ),
              InkWell(
                child: Container(
                  width: 90.0,
                  height: 90.0,
                  color: Colors.red,
                  child: Icon(Icons.people),
                ),
              )
            ],
          ),
        ],
      ),
    );
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
