
import 'package:flutter/material.dart';
import 'package:salaya/comp1.dart';

class Jasa extends StatefulWidget {

  @override
  State<Jasa> createState() => _JasaState();
}

class _JasaState extends State<Jasa> {


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
          "Penyedia Jasa",
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
                    "Jasa Pemboran Air Artesis dan Services",
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
                  "Kedalaman sumur 20 m : Rp. 2.000.000 "
                      "Kedalaman sumur 30 m : Rp. 3.000.000 "
                      "Kedalaman sumur 40 m : Rp. 4.000.000 "
                  "Kedalaman sumur 50 m : Rp. 5.000.000",
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
                  MaterialPageRoute(builder: (context)=>Comp1()
                    ,
                  ),
                );
                }, child: Text(
                "Bandung Water Solution",style: TextStyle(
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
                onPressed: () {}, child: Text(
                "Ady Water",style: TextStyle(
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
                onPressed: () {}, child: Text(
                "Aneka Filter",style: TextStyle(
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
                onPressed: () {}, child: Text(
                "Filter Air",style: TextStyle(
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
