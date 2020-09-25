import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

//void main() => runApp(MyApp());

class Carte extends StatefulWidget {
  @override
  _CarteState createState() => _CarteState();

}


class _CarteState extends State<Carte> {


  Completer<GoogleMapController> _controller = Completer();

  //static const LatLng _center = const LatLng(6.3703, 2.3912);
  static const LatLng _center = const LatLng(9.3220475, 2.313137999999981);


  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;
  static List<Map> places=new List<Map>();

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  



  BitmapDescriptor pinLocationIcon;
  static BitmapDescriptor myIcon;
  @override
  void initState() {
    super.initState();
    setCustomMapPin();

  }
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/logo.png');
  }
  //////
  Marker mark1 = Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId("146".toString()),
    position: LatLng(45.5302, -122.6812),
    infoWindow: InfoWindow(
      title: 'Really cool place',
      snippet: '5 Star Rating',
    ),

    //icon: BitmapDescriptor.defaultMarker,

    icon: BitmapDescriptor.defaultMarker,

  );

  Marker mark = new Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId("145"),
    position: LatLng(45.5051, -122.6750),
    infoWindow: InfoWindow(
      title: 'Really cool place',
      snippet: '5 Star Rating',
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(30.0),
  );
  //UNE LISTE DE MARKERS
  //DataManager dataManager = DataManager.instance();
  List<Marker> mk =new List<Marker>();




  ////
  

  void _onAddMarkerButtonPressed() {
    setState(() {
      //A LA PLACE FAIRE UNE BOUCLE FOR POUR AJOUTER LES PLACES RECUES DE LA BASE DE DONNES


      places.addAll(
        //cotonou
          [{'lon':2.433333,'lat':6.366667,'nom':'Topka Naomi','contact':'95218796'},
           // calavi
            {'lon':2.354245,'lat':6.4538637,'nom':'Toffo Marli','contact':'65102696'},
            //Tandji, Zapkota
            {'lon':2.159661,'lat':7.2992053,'nom':'Konda Karle','contact':'97896523'},
            //Tanve
            {'lon':1.9653,'lat':7.13387,'nom':'Mahoume Daniel','contact':'95218796'},
            //Agbangnizoun
            {'lon':1.9646451,'lat':7.0690113,'nom':'Toffadji Marc','contact':'67895621'},
            //Djidja
            {'lon':1.9769065,'lat':7.3991191,'nom':'Toti Zac','contact':'96547821'},
            //Glazoué
            {'lon':2.2291358,'lat':8.1681173,'nom':'Toudo Leon','contact':'60705698'},
            //8.1681173
            {'lon':1.8696095,'lat':8.3300779,'nom':'Sota Jean', 'contact':'50235697'},
            //Zinvié
            {'lon':2.3567957,'lat':6.6133818,'nom':'Cofa Moli', 'contact':'21456398'},
            //Okpara, Tchaourou, Bénin
            {'lon':2.7381368,'lat':8.7968454,'nom':'Todji Salomon','contact':'95789632'}

           ]);

      for(int a=0;a<9;a++)
      {
        if( a % 3==0)
        {
          mk.add(new Marker(
              markerId: MarkerId('$a'),
              position: LatLng(places.elementAt(a)['lat'],places.elementAt(a)['lon']),
              infoWindow: InfoWindow(
                title: places.elementAt(a)['nom'],
                snippet: places.elementAt(a)['contact'],
              ),
            icon: BitmapDescriptor.defaultMarkerWithHue(60.0),//pour les jaunes
          ));

        }

        else if(a%4==0)
          {
            mk.add(new Marker(
              markerId: MarkerId('$a'),
              position: LatLng(places.elementAt(a)['lat'],places.elementAt(a)['lon']),
              infoWindow: InfoWindow(
                title: places.elementAt(a)['nom'],
                snippet: places.elementAt(a)['contact'],
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),//pour les vert
            ));
          }

        else
          {
            mk.add(new Marker(
              markerId: MarkerId('$a'),
              position: LatLng(places.elementAt(a)['lat'],places.elementAt(a)['lon']),
              infoWindow: InfoWindow(
                title: places.elementAt(a)['nom'],
                snippet: places.elementAt(a)['contact'],
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(54.0),//pour les gris
            ));
          }

      }


      //_markers.addAll(mk);
//
    _markers.addAll(mk);
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
      child: new Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 7.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
