import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pitjarus/service/dbhelper.dart';

class StoresController extends GetxController{


  Completer<GoogleMapController> controller = Completer();
  Iterable markers = [];


  late Map<String, double> userLocation;

  LatLng initialPosition = LatLng(37.42796133588664, -122.885740655967);

  List<Map<String, dynamic>> stores = [];



  late LocationData currentPosition;
  late String address,dateTime;
  late GoogleMapController mapController;
  late Marker marker;
  Location location = Location();

  LatLng initialcameraposition = LatLng(0.5937, 0.9629);


  @override
  void onInit() {
    super.onInit();
    getLoc();
  }
//list marker
  final Iterable markerss = Iterable.generate(AppConstant.list.length, (index) {
    return Marker(
        markerId: MarkerId(AppConstant.list[index]['id']),
        position: LatLng(
          AppConstant.list[index]['lat'],
          AppConstant.list[index]['lon'],
        ),
        infoWindow: InfoWindow(title: AppConstant.list[index]["title"])
    );
  });



  void deleteall(id) async{
    final data = await SQLHelper.deleteItem(id);
  }

  getLoc() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentPosition = await location.getLocation();
    initialcameraposition = LatLng(currentPosition.latitude!,currentPosition.longitude!);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");

        currentPosition = currentLocation;
        initialcameraposition = LatLng(currentPosition.latitude!,currentPosition.longitude!);

    });
  }



}
class AppConstant {
  static List<Map<String, dynamic>> list = [
    {"title": "one", "id": "1", "lat": -6.3168257, "lon": 106.8738759},
    {"title": "two", "id": "2", "lat": -6.3168257, "lon": 106.8738759},
    {"title": "three", "id": "3", "lat": -6.3168257, "lon": 106.8738759},
  ];
}