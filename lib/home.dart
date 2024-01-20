import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salaya/jasa.dart';
import 'package:salaya/air.dart';
import 'package:salaya/login.dart';
import 'package:salaya/profile.dart';

import 'constant/akun.dart';
import 'constant/constant.dart';
import 'constant/popup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<PopupChoices> choices = <PopupChoices>[
    PopupChoices(title: Akun.getstoredAkun()!.nama, icon: Icons.person_outline),
    PopupChoices(title: 'Log Out', icon: Icons.exit_to_app),
  ];

  void onItemMenuPress(PopupChoices choice) {
    if (choice.title == 'Log Out') {
      handleSignOut();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
    }
  }

  Future<void> handleSignOut() async {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => login()),
          (Route<dynamic> route) => false,
    );
  }


  Future<bool> onBack() {
    openDialog();
    return Future.value(false);
  }
  Future<void> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: ColorConstants.themeColor,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Text(
                      'Yakin ingin keluar?',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.cancel,
                        color: ColorConstants.primaryColor,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Batalkan',
                      style: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check_circle,
                        color: ColorConstants.primaryColor,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Keluar',
                      style: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBack,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.themeColor,
          title: Text(
            "Salaya",
            style: TextStyle(
              color: ColorConstants.textColor,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[buildPopupMenu()],
        ),
        body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConstants.themeColor,
                    Colors.white,
                  ]
              )
          ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("aset/logo.png",
                  width: 200,
                  height: 200,),
                  SizedBox(height: 20,width: 800,),
                  TextButton.icon(onPressed: () async {Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Air()));},
                        icon: const Icon(Icons.water_drop_outlined,color: Colors.white,),
                        label: Text("Penyedia Air", style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                        ),
                      ),
                      TextButton.icon(onPressed: () async {Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => Jasa()));},
                        icon: const Icon(Icons.engineering,color: Colors.white,),
                        label: Text("Penyedia Jasa", style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                        ),
                      ),

                    ],
              ),
        ),
      ), //
      // This trailing comma makes auto-formatting nicer for build methods.
    ),);
  }
  Widget buildPopupMenu() {
    return PopupMenuButton<PopupChoices>(
      onSelected: onItemMenuPress,
      itemBuilder: (BuildContext context) {
        return choices.map((PopupChoices choice) {
          return PopupMenuItem<PopupChoices>(
              value: choice,
              child: Row(
                children: <Widget>[
                  Icon(
                    choice.icon,
                    color: ColorConstants.primaryColor,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    choice.title,
                    style: TextStyle(color: ColorConstants.primaryColor),
                  ),
                ],
              ));
        }).toList();
      },
    );
  }
}
