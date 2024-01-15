
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salaya/login.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;


class daftar extends StatefulWidget{


  @override
  _daftarState createState() => _daftarState();
}

class _daftarState extends State<daftar> {
  bool _visible = false;

  final usnKontrol = TextEditingController();
  final pasKontrol = TextEditingController();
  final pas2Kontrol = TextEditingController();

  Future masuk() async {
    var url = Uri.parse("https://pemweb-yakfi.000webhostapp.com/daftar.php");

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
                  Icons.exit_to_app,
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
                  Icons.cancel,
                  color: Colors.black,
                ),
                margin: EdgeInsets.only(right: 10),
              ),
              Text(
                'Batalkan',
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
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              iconTheme: IconThemeData(color : Colors.white),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("aset/bg.png"),
                      fit: BoxFit.cover,
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
                          color: Colors.white,
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
                                primaryColor: Colors.white,
                                primaryColorDark: Colors.white,
                                hintColor: Colors.white, //placeholder
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: usnKontrol,
                                decoration: InputDecoration(
                                  focusedBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                                  labelText: 'Masukan Username',
                                  labelStyle: TextStyle(color:Colors.white),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  hintText: 'Username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon Isi Username';
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
                                primaryColor: Colors.white,
                                primaryColorDark: Colors.white,
                                hintColor: Colors.white, //placeholder
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: pasKontrol,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Masukan Password',
                                  labelStyle: TextStyle(color:Colors.white),
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
                                primaryColor: Colors.white,
                                primaryColorDark: Colors.white,
                                hintColor: Colors.white, //placeholder
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: pas2Kontrol,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Masukan Ulang Password',
                                  labelStyle: TextStyle(color:Colors.white),
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
                                        color: Colors.black),
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
                    SizedBox(height: 200,)
                  ],
                ),
              ),
            )
        )
    );
  }
  void pass(p1,p2){
    if(p1==p2){
      masuk();
    }else{
      AlertDialog(
        title: new Text("Password tidak sama"),
        actions: <Widget>[
          TextButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
  }

}
