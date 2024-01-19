
import 'package:flutter/material.dart';
import 'package:salaya/login.dart';
import 'package:salaya/constant/constant.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // just delay for showing this slash page clearer because it too fast
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    });
  }

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