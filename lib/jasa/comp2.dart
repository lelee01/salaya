import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Comp2 extends StatefulWidget {

  @override
  State<Comp2> createState() => _Comp2State();
}

class _Comp2State extends State<Comp2> {
  String map = 'https://maps.app.goo.gl/smdSvDEXdPq4iZnD9?g_st=iw';
  String wa = 'https://wa.me/6281221654304?';

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
          "Ady Water",
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
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Alamat : Jl. Raya Mande No.26, Cikadut, Kec. Cimenyan, Kabupaten Bandung, Jawa Barat 40195",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {_bukaLink(map);},
                      icon: const Icon(Icons.pin_drop_outlined, color: Colors.white,),
                      label: Text(
                        "Rute",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                    ),
                    Text( "Kontak : 0812-2165-4304",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {_bukaLink(wa);},
                      icon: const Icon(Icons.call, color: Colors.white,),
                      label: Text(
                        "Whatsapp",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                    ),
                  ],
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
Future<void> _bukaLink(String url) async{
  final Uri uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }else{
    throw'Link tidak bisa dibuka';
  }
}
