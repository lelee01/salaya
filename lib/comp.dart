import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'constant/comp.dart';
import 'constant/constant.dart';

class CompA1 extends StatefulWidget {

  @override
  State<CompA1> createState() => _CompA1State();
}

class _CompA1State extends State<CompA1> {

  String nama = Comp.getstoredComp()!.nama;
  String kategori = Comp.getstoredComp()!.kategori;
  String rating = Comp.getstoredComp()!.rating;
  String alamat = Comp.getstoredComp()!.alamat;
  double lat = double.parse(Comp.getstoredComp()!.lat);
  double lng = double.parse(Comp.getstoredComp()!.lng);
  String cp = Comp.getstoredComp()!.cp;
  String wa = 'https://wa.me/62';

  late GoogleMapController mapController;
  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        title: Text(
          'Profile Perusahaan',
          style: TextStyle(
            color: ColorConstants.textColor,
          ),
        ),
        centerTitle: true,
      ),
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
                          nama,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 24,
                          ),
                        ),
                        SafeArea(
                            child: Container(
                              width: double.infinity,
                              height: 300,
                              child: GoogleMap(
                                onMapCreated: (controller) {
                                  setState(() {
                                    mapController = controller;
                                    addMarker();
                                  });
                                },
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(lat, lng), // San Francisco coordinates
                                  zoom: 16.0,
                                ),
                                markers: markers,
                              ),
                            )
                        ),
                        Text(
                          "Alamat : "+alamat,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 17,
                          ),
                        ),
                        RatingBarIndicator(
                          rating: double.parse(rating),
                            itemBuilder: (context, index)=>Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          itemCount: 5,
                          itemSize: 50,
                          direction: Axis.horizontal,
                        ),
                        Text( "Kontak : +62"+cp,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 17,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {_bukaLink(wa+cp+'?');},
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
  void addMarker(){
    Marker newMarker = Marker(
      markerId: MarkerId("1"), // A unique identifier for the marker
      position: LatLng(lat, lng), // Marker position
      infoWindow: InfoWindow(
        title: nama,
        snippet: "Perusahaan",
      ),
    );

    // Add the marker to the set of markers
    markers.add(newMarker);

    // Update the map to display the new marker
    mapController.animateCamera(CameraUpdate.newLatLng(newMarker.position));
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
