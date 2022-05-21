import 'package:flutter/material.dart';
import 'dart:async';
import 'package:postest6/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void inistate() {
    super.initState();
    SplashScreenStart();
  }

  SplashScreenStart() {
    return Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SplashScreenStart();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/logo.png",
                width: 180, height: 180, fit: BoxFit.cover),
            SizedBox(
              height: 24.0,
            ),
            Text("BOSHELM",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                )),
            Padding(padding: EdgeInsets.fromLTRB(100, 300, 20, 20)),
            Text("Penjualan Helm Motor",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ))
          ],
        ),
      ),
    );
  }
}
