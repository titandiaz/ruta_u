import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
      title: Text('Tabs Demo'),
    );
  }
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     height: 270,
  //     color: Color(0xff3369FF),
  //     child: Text("Ruta U",
  //         style: TextStyle(
  //             fontFamily: "Cocogoose", fontSize: 31, color: Colors.white)),
  //   );
  // }
}
