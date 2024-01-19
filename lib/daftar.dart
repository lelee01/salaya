
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salaya/login.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;

import 'constant/constant.dart';


class daftar extends StatefulWidget{


  @override
  _daftarState createState() => _daftarState();
}

class _daftarState extends State<daftar> {
  bool _visible = false;

  final namaKontrol = TextEditingController();
  final usnKontrol = TextEditingController();
  final pasKontrol = TextEditingController();
  final pas2Kontrol = TextEditingController();

  Future masuk() async {
    var url = Uri.parse("https://pemweb-yakfi.000webhostapp.com/daftar.php");

    setState(() {
      _visible = true;
    });

    var data = {
      'nama': namaKontrol.text,
      'email': usnKontrol.text,
      'pass': pasKontrol.text,
    };

    var response = await http.post(url, body: json.encode(data));
    print (data);
    if (response.statusCode == 200) {
      print(response.body);
      var msg = jsonDecode(response.body);

      if (msg['daftar'] == true) {
        setState(() {
          _visible = false;
        });

        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => login()));
      } else {
        setState(() {
          _visible = false;

          showMessage("Email atau password salah");
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
                      'Silakan Registrasi Akun',
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
                                controller: namaKontrol,
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
                                  labelText: 'Masukan Nama Lengkap',
                                  labelStyle: TextStyle(color:ColorConstants.textColor),
                                  prefixIcon: const Icon(
                                    Icons.person_pin_rounded,
                                    color: Colors.white,
                                  ),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorConstants.textColor,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  hintText: 'Nama Lengkap',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon Isi Nama Lengkap';
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
                            Theme(
                              data: new ThemeData(
                                primaryColor: ColorConstants.textColor,
                                hintColor: ColorConstants.textColor, //placeholder
                              ),
                              child: TextFormField(
                                style: TextStyle(color: ColorConstants.textColor),
                                controller: pas2Kontrol,
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
                                  labelText: 'Masukan Ulang Password',
                                  labelStyle: TextStyle(color:ColorConstants.textColor),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Konfirmasi Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon Konfirmasi Password';
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
                                onPressed: () => {pass(pasKontrol.text,pas2Kontrol.text)},
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
  void pass(p1,p2){
    if(p1==p2){
      masuk();
    }else{
      showMessage("Password tidak cocok");
    }
  }

}
