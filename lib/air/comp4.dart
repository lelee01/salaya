import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class CompA4 extends StatefulWidget {

  @override
  State<CompA4> createState() => _CompA4State();
}

class _CompA4State extends State<CompA4> {
  String map = 'https://maps.app.goo.gl/pqDKz7YkTHZxvZP87?g_st=iw';
  String wa = 'https://wa.me/6287700885967?';

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
          "Al-Ma'Soem",
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
                      "Alamat : Jl. Kembang Sapatu, Samoja, Kec. Batununggal, Kota Bandung, Jawa Barat 40273",
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
                    Text( "Kontak : 0877-0088-5967",
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
