import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => {},
          ),
        ],
        title: Text('Perfíl'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.fvvc1-1.fna.fbcdn.net/v/t1.0-9/41792838_10156623631548431_824051181532741632_n.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_eui2=AeHwf-h-XMcVVi4kKI6FSKsbgv3I8gurTQeC_cjyC6tNB4n3LdsWHWdFk1WH9kSqZ68&_nc_ohc=4kJMiu0DuGgAX8W-9q8&_nc_ht=scontent.fvvc1-1.fna&oh=064afce2bdcd1a047a6777a93a051b2a&oe=5EF95974'),
                radius: 40.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                // color: Colors.grey,
                border: Border.all(
                  width: 0.4,
                  color: Colors.grey,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Cristian Diaz",
                        style: TextStyle(
                          // fontFamily: "Cocogoose",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Universidad Cooperativa de Colombia",
                        style: TextStyle(
                          // fontFamily: "Cocogoose",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "56",
                            style: TextStyle(
                              // fontFamily: "Cocogoose",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Total Viajes",
                            style: TextStyle(
                              // fontFamily: "Cocogoose",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 10.0,
                        // width: 10.0,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Ingeniería",
                            style: TextStyle(
                              // fontFamily: "Cocogoose",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Facultad",
                            style: TextStyle(
                              // fontFamily: "Cocogoose",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Información Personal",
                    style: TextStyle(
                      // fontFamily: "Cocogoose",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.phone_android),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "+57 3137894561",
                        style: TextStyle(
                            // fontFamily: "Cocogoose",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.mail),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "cristian.diazmu@campusucc.edu.co",
                        style: TextStyle(
                            // fontFamily: "Cocogoose",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.drive_eta),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Conductor",
                        style: TextStyle(
                            // fontFamily: "Cocogoose",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.home),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Carrera 12 # 34 - 56, Villavicencio",
                        style: TextStyle(
                            // fontFamily: "Cocogoose",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
