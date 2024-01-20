
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salaya/login.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;

import 'constant/akun.dart';
import 'constant/constant.dart';


class profile extends StatefulWidget{


  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  String nama = Akun.getstoredAkun()!.nama;
  String email = Akun.getstoredAkun()!.email;
  String pass = Akun.getstoredAkun()!.password;
  String alamat = Akun.getstoredAkun()!.alamat;
  String hp = Akun.getstoredAkun()!.hp;

  final FocusNode focusNama = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();
  final FocusNode focusAlamatl = FocusNode();
  final FocusNode focusHp = FocusNode();

  TextEditingController? namaKontrol;
  TextEditingController? emailKontrol;
  TextEditingController? pasKontrol;
  TextEditingController? alamatKontrol;
  TextEditingController? hpKontrol;

  @override
  void initState(){
    super.initState();
    readLocal();
  }

  void readLocal(){
    namaKontrol = TextEditingController(text: nama);
    emailKontrol = TextEditingController(text: email);
    pasKontrol = TextEditingController(text: pass);
    alamatKontrol = TextEditingController(text: alamat);
    hpKontrol = TextEditingController(text: hp);
  }

  Future update() async {
    focusNama.unfocus();
    focusEmail.unfocus();
    focusPass.unfocus();
    focusAlamatl.unfocus();
    focusHp.unfocus();
    var url = Uri.parse("https://pemweb-yakfi.000webhostapp.com/update.php");

    var data = {
      'id' : Akun.getstoredAkun()!.id,
      'nama': namaKontrol?.text,
      'email': emailKontrol?.text,
      'pass': pasKontrol?.text,
      'alamat': alamatKontrol?.text,
      'hp': hpKontrol?.text,
    };

    var response = await http.post(url, body: json.encode(data));
    print (data);
    if (response.statusCode == 200) {
      print(response.body);
      var msg = jsonDecode(response.body);
      if (msg['update'] == true) {
        Akun.fromJson(msg['updateUser']);
        setState(() {
          showMessage(msg['message']);
        });
      } else {
        setState(() {
          showMessage("Gagal update data akun");
        });
      }
    } else {
      setState(() {
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
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        title: Text(
          "Perbaharui Data Akun",
          style: TextStyle(
            color: ColorConstants.textColor,
          ),
        ),
        centerTitle: true,
      ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Nama Pengguna',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.textColor),
                        ),
                        margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                      ),
                      Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukan Nama Pengguna',
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(color: ColorConstants.textColor),
                            ),
                            controller: namaKontrol,
                            onChanged: (value) {
                              nama = value;
                            },
                            focusNode: focusNama,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30),
                      ),
                      Container(
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.textColor),
                        ),
                        margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                      ),
                      Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukan Email',
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(color: ColorConstants.textColor),
                            ),
                            controller: emailKontrol,
                            onChanged: (value) {
                              email = value;
                            },
                            focusNode: focusEmail,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30),
                      ),
                      Container(
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.textColor),
                        ),
                        margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                      ),
                      Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukan Password',
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(color: ColorConstants.textColor),
                            ),
                            controller: pasKontrol,
                            onChanged: (value) {
                              pass = value;
                            },
                            focusNode: focusPass,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30),
                      ),
                      Container(
                        child: Text(
                          'Alamat',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.textColor),
                        ),
                        margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                      ),
                      Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukan Alamat',
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(color: ColorConstants.textColor),
                            ),
                            controller: alamatKontrol,
                            onChanged: (value) {
                              alamat = value;
                            },
                            focusNode: focusAlamatl,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30),
                      ),
                      Container(
                        child: Text(
                          'Nomor Telepon',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.textColor),
                        ),
                        margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                      ),
                      Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukan Nomor Telepon',
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(color: ColorConstants.textColor),
                            ),
                            controller: hpKontrol,
                            onChanged: (value) {
                              hp = value;
                            },
                            focusNode: focusHp,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => {update()},
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Update',
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
}