import 'package:flutter/material.dart';
import 'package:salaya/jasa.dart';
import 'package:salaya/air.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Image.asset("aset/logo.png",
                  width: 200,
                  height: 200,),
                  SizedBox(height: 20,width: 800,),
                  TextButton.icon(onPressed: () async {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Air(),
                        ),
                      );
                      },
                        icon: const Icon(Icons.water_drop_outlined,color: Colors.white,),
                        label: Text("Penyedia Air", style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                        ),
                      ),
                      TextButton.icon(onPressed: () async {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Jasa(),
                        ),
                      );
                      },
                        icon: const Icon(Icons.engineering,color: Colors.white,),
                        label: Text("Penyedia Jasa", style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
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
