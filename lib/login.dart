
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salaya/admin/admin.dart';
import 'package:salaya/constant/akun.dart';
import 'package:salaya/constant/constant.dart';
import 'package:salaya/home.dart';
import 'package:salaya/daftar.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatefulWidget{


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<login> {
  bool _visible = false;
  late final SharedPreferences prefs;

  final usnKontrol = TextEditingController();
  final pasKontrol = TextEditingController();

  Future masuk() async {
    var url = Uri.parse("https://pemweb-yakfi.000webhostapp.com/login.php");

    setState(() {
      _visible = true;
    });

    var data = {
      'email': usnKontrol.text,
      'pass': pasKontrol.text,
    };

    var response = await http.post(url, body: json.encode(data));
    print (data);
    if (response.statusCode == 200) {
      print(response.body);
      var msg = jsonDecode(response.body);

      if (msg['loginStatus'] == true) {
        setState(() {
          _visible = false;
          Akun.fromJson(msg['userInfo']);
        });

        Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => MyHomePage()));
      } else if (msg['admin'] == true) {
        setState(() {
          _visible = false;

          Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) => admin()));
        });
      }
      else {
        setState(() {
          _visible = false;

          showMessage(msg["message"]);
        });
      }
    } else {
      setState(() {
        _visible = false;

        showMessage("Tidak dapat terhubung ke database");
      });
    }
  }

  Future<dynamic> showMessage(String _msg) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.info_outline,
                        size: 30,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Text(
                      _msg,
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
                        Icons.check,
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'OK',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
              child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: _visible,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: LinearProgressIndicator(),
                  ),
                ),
                Container(
                  height: 100.0,
                ),
                Image.asset(
                  'aset/logo.png',
                  scale: 5,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Silakan Login Terlebih Dahulu',
                  style: TextStyle(
                      color: ColorConstants.textColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Theme(
                          data: new ThemeData(
                            primaryColor: ColorConstants.textColor,
                            hintColor: ColorConstants.textColor, //placeholder
                          ),
                          child: TextFormField(
                            style: TextStyle(color: ColorConstants.textColor),
                            controller: usnKontrol,
                            decoration: InputDecoration(
                              focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.textColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.textColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Masukan Email',
                              labelStyle: TextStyle(color:ColorConstants.textColor),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.textColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mohon Isi Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: new ThemeData(
                            primaryColor: ColorConstants.textColor,
                            hintColor: ColorConstants.textColor, //placeholder
                          ),
                          child: TextFormField(
                            style: TextStyle(color: ColorConstants.textColor),
                            controller: pasKontrol,
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.textColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.textColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.textColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Masukan Password',
                              labelStyle: TextStyle(color:ColorConstants.textColor),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mohon Isi Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => {masuk()},
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Masuk',
                                style: TextStyle(fontSize: 18.0,
                                color: ColorConstants.textColor),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white)),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              Text("Belum Punya Akun?",style:
                TextStyle(color: ColorConstants.textColor,fontSize: 18),),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>daftar(),
                    ),
                  );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Daftar',
                      style: TextStyle(fontSize: 18.0,
                          color: ColorConstants.textColor),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
              ],
            ),
          ),
        )
    );
  }
}