
import 'package:flutter/material.dart';
import 'package:salaya/constant/constant.dart';

class admin extends StatefulWidget {
  admin({super.key});

  @override
  adminState createState() => adminState();
}

class adminState extends State<admin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstants.themeColor, Colors.white,
                ]
            )
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "aset/logo.png",
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}