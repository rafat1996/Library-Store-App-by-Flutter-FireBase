import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  static const String routName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(33.524910, 36.303574);
  final double _zoom = 15.0;

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: MarkerId("marker_id"),
        position: _latLng,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/bitmap.png'),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("موقع المكتبة",
                              style: TextStyle(
                                  fontFamily: 'cairo', color: Colors.white))
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
            _latLng,
          );
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/appBar1.jpg'),
                  fit: BoxFit.cover)),
        ),
        centerTitle: true,
        elevation: .5,
        title: Text(
          'موقعنا',
          style: TextStyle(fontFamily: 'Cairo'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 75,
            width: 180,
            offset: 50,
          ),
        ],
      ),
    );
  }
}



















//   static final LatLng _kMapCenter = LatLng(33.524910, 36.303574);
//   Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> markers = Set(); //markers for google map
//   static final CameraPosition _kInitialPosition =
//       CameraPosition(target: _kMapCenter, zoom: 17.0, tilt: 0, bearing: 0);
//   @override
//   void initState() {
//     addMarkers();
//     super.initState();
//   }

//   addMarkers() async {
//     BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(),
//       "assets/image/bitmap.png",
//     );

//     markers.add(Marker(
//       //add start location marker
//       markerId: MarkerId(LatLng(33.524910, 36.303574).toString()),
//       position: LatLng(33.524910, 36.303574), //position of marker
//       infoWindow: InfoWindow(
//         //popup info
//         title: 'Starting Point ',
//         snippet: 'Start Marker',
//       ),
//       icon: markerbitmap, //Icon for Marker
//     ));

//     setState(() {
//       //refresh UI
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Demo'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: _kInitialPosition,
//         markers: addMarkers(),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
// }

//   GoogleMapController? mapController;

//   final Set<Marker> markers = {};
//   final LatLng _center = const LatLng(33.524910, 36.303574);
//   BitmapDescriptor? mapMarker;
//   void setCustomMarker() async {
//     mapMarker = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(), 'assets/image/bitmap.png');
//   }

//   Set<Marker> getmarkers() {
//     setState(() {
//       markers.add(
//         Marker(
//             icon: mapMarker!,
//             markerId: MarkerId('id-1'),
//             position: LatLng(33.524910, 36.303574),
//             infoWindow: InfoWindow(title: 'موقع متجرنا')),
//       );
//     });

//     return markers;
//   }

//   @override
//   void initState() {
//     setCustomMarker();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/image/appBar1.jpg'),
//                   fit: BoxFit.cover)),
//         ),
//         centerTitle: true,
//         elevation: .5,
//         title: Text(
//           'موقعنا',
//           style: TextStyle(fontFamily: 'Cairo'),
//         ),
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//         markers: getmarkers(),
//         myLocationEnabled: true,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 19,
//         ),
//       ),
//     );
//   }
// }

// _getAddressFromLatLng() async {
//   try {
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//         _currentPosition.latitude, _currentPosition.longitude);

//     Placemark place = placemarks[0];

//     setState(() {
//       _currentAddress =
//           "${place.locality}, ${place.postalCode}, ${place.country}";
//     });
//   } catch (e) {
//     print(e);
//   }
// }

// _getCurrentLocation() {
//   Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best,
//           forceAndroidLocationManager: true)
//       .then((Position position) {
//     setState(() {
//       _currentPosition = position;
//       _getAddressFromLatLng();
//     });
//   }).catchError((e) {
//     print(e);
//   });
// }

// late Position _currentPosition;
// String? _currentAddress;
// Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       if (_currentAddress != null) Text(_currentAddress!),
//       FlatButton(
//         child: Text("Get location"),
//         onPressed: () {
//           _getCurrentLocation();
//         },
//       ),
//     ],
//   ),
// ),
