
import 'package:flutter/material.dart';
import 'package:salaya/air/comp1.dart';
import 'package:salaya/air/comp2.dart';
import 'package:salaya/air/comp3.dart';
import 'package:salaya/air/comp4.dart';
import 'package:salaya/air/comp5.dart';

class Air extends StatefulWidget {

  @override
  State<Air> createState() => _AirState();
}

class _AirState extends State<Air> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color : Colors.white),
        title: Text(
          "Penyedia Air",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("aset/bg.png"),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 800,),
              Container(
                  width: double.infinity,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Column(children: [
                    Text(
                      "Jasa Penyedia Air",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Estimasi Harga",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],)
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text(
                  "Air per tangki : Rp. 250.000-350.000",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Daftar Perusahaan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CompA1()
                    ,
                  ),
                );
                }, child: Text(
                "Air Bersih Utama Mandiri",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CompA2()
                    ,
                  ),
                );
                }, child: Text(
                "Air Gunung Manglayang",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CompA3()
                    ,
                  ),
                );
                }, child: Text(
                "Zam Zam",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CompA4()
                    ,
                  ),
                );
                }, child: Text(
                "Al-Ma'Soem",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CompA5()
                    ,
                  ),
                );
                }, child: Text(
                "Tirta Raharja",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
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
    );
  }
}
