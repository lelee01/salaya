import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Comp4 extends StatefulWidget {

  @override
  State<Comp4> createState() => _Comp4State();
}

class _Comp4State extends State<Comp4> {
  String map = 'https://maps.app.goo.gl/5SLYqKqnjounNjma9?g_st=iw';
  String wa = 'https://wa.me/6281320179449?';

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
          "Filter Air",
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
                      "Alamat : Jl. Holis No.324, Caringin, Kec. Bandung Kulon, Kota Bandung, Jawa Barat 40212",
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
                    Text( "Kontak : 0813-2017-9449",
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
