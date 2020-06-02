import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Color(0xffBCCBF6),
        child: Center(
            child: SpinKitChasingDots(
          color: Color(0xff3369FF),
          size: 50.0,
        )),
      ),
    );
  }
}
