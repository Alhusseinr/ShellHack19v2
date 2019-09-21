import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> markers = {};

  static const LatLng _center = const LatLng(45.5215, -122.677);

  LatLng lastMapPosition = _center;

  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  void onCameraMove(CameraPosition position){
    lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Route"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0
            ),
            markers: markers,
            onCameraMove: onCameraMove,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){},
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );


//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Maps Sample App'),
//          backgroundColor: Colors.green[700],
//        ),
//        body: GoogleMap(
//          onMapCreated: _onMapCreated,
//          initialCameraPosition: CameraPosition(
//            target: _center,
//            zoom: 12.0,
//          ),
//          markers: markers,
//          onCameraMove: onCameraMove,
//        ),
//      ),
//    );
  }
}