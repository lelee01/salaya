
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salaya/constant/constant.dart';

import 'comp.dart';
import 'constant/comp.dart';

class Air extends StatefulWidget {

  @override
  State<Air> createState() => _AirState();
}

class _AirState extends State<Air> {
  List<dynamic> data=[];

  Future<String> getData() async{
    var url = Uri.parse("https://pemweb-yakfi.000webhostapp.com/getComp.php");
    var data = {
      'kategori': 'air',
    };

    var response = await http.post(url, body: json.encode(data));
    print (data);

    if (response.statusCode == 200) {
      print(response.body);
      var msg = jsonDecode(response.body);
      // Cast it to List<dynamic>
      List<dynamic> dataCompList = msg['dataComp'];
      setState(() {
        this.data = dataCompList;
      });
    }else{
      return'Gagal';
    }
    return'Berhasil';
}

@override
void initState(){
    this.getData();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        title: Text(
          "Penyedia Air",
          style: TextStyle(
            color: ColorConstants.textColor,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
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
          child: ListView.builder(
            itemCount: data == null ?0 : data.length,
              itemBuilder: (BuildContext context, int index){
              return Card(
                color: Colors.grey,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                     Comp.fromJson(data[index]);
                    });
                    // Navigate to another page using Navigator
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompA1()),
                    );
                  },child: Text(
                  data[index]['nama'],style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 18,
                ),
                ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                ),
              );
              }
          )
        ),
      ), //
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
