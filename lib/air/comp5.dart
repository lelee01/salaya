
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:salaya/mframe.dart';

class CompA5 extends StatefulWidget {

  @override
  State<CompA5> createState() => _CompA5State();
}

class _CompA5State extends State<CompA5> {
  String map = 'https://maps.app.goo.gl/TMKsxSNNgB8bd2LA9?g_st=iw';
  String mpp = 'https://www.google.com/maps/place/Pdam+Tirta+Raharja+Cabang+V+Cimahi/@-6.8680927,107.5354558,17z/data=!3m1!4b1!4m6!3m5!1s0x2e68e46774ef26f5:0x3c69d10d5312f79e!8m2!3d-6.8680927!4d107.5354558!16s%2Fg%2F11b6bd_bnz?hl=id-ID&entry=ttu';
  String wa = 'http://www.tirtaraharja.co.id/';

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
          "Tirta Raharja",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
        child:Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                      "Alamat : Jl. Sangkuriang No.19 No 23, Padasuka, Kec. Cimahi Utara, Kota Cimahi, Jawa Barat 40511",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SafeArea(
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          child: MapView(),
                        )),
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
                    Text( "Webiste : Perumda Air Minum Tirta Raharja",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {_bukaLink(wa);},
                      icon: const Icon(Icons.link, color: Colors.white,),
                      label: Text(
                        "Website",style: TextStyle(
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
      ),
    ),
      ),//
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
