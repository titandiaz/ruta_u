import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';

class InitialMap extends StatefulWidget {
  InitialMap({Key key}) : super(key: key);

  
  @override
  _InitialMapState createState() => _InitialMapState();
}


class _InitialMapState extends State<InitialMap> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('map')),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          titleSpacing: 0.0,
          elevation: 0.0,
          // backgroundColor: Colors.transparent,
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //       margin: EdgeInsets.only(left: 20.0, top: 15.0),
          //       child: IconButton(
          //         iconSize: 30,
          //         icon: Icon(
          //           Icons.menu,
          //           color: Colors.black,
          //           // size: 32,
          //           ),
          //         onPressed: (){},
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 50.0),
            ListTile(
              title: Text('Mi perfil',
              style: GoogleFonts.nunitoSans(
                color: Color(0xff383D62),
                letterSpacing: 0.07,
                fontSize: 18,
              ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/edit_profile');
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            _crearFlutterMap(),
          ],
        ),
      ),
      
      bottomNavigationBar: _botttomNavigationBar(context)
    );
  }

  Widget _botttomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.blue,
        textTheme: Theme.of(context)
        .textTheme
        .copyWith(caption: TextStyle(color: Colors.black26))
      ),
      child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Color(0xFFEEEEEE),
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.transparent,
          showSelectedLabels: false,   // <-- HERE
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                size: 30.0,
              ),
              title: Text('Locación')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.add_circle,
                  size: 40.0,
                ),
              title: Text(
                'Agregar',
                style: TextStyle(fontSize: 13),
              )
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.directions_car,
                size: 30.0,
              ),
              title: Text(
                'Tiempo',
                style: TextStyle(fontSize: 13),
              )
            ),
          ],
        ),
    );
  }

  Widget _crearFlutterMap() {
    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(4.15, -73.633),
        zoom: 11.0,
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']
    );
  }

  _crearMarcadores() {
    return MarkerLayerOptions(
      markers: <Marker> [
        Marker(
          width: 100.0,
          height: 100.0,
          point: new LatLng(4.15, -73.633),
          builder: ( context ) => Container(
            child: Icon(
              Icons.location_on,
              size: 45.0,
              color: Theme.of(context).primaryColor,
            )
          )
        )
      ]
    );
  }

}