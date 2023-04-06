import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}


class _GoogleMapScreenState extends State<GoogleMapScreen> {
  var markers = HashSet<Marker>();
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: DrawerWidget(name: "Moaz"),
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(30.033333, 31.233334),
                    zoom: 14),
                markers: markers,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.sp, vertical: 45.sp),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                      onTap: () async{
                        Position position = await _determinePosition();
                        googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 4)));
                        markers.clear();
                        markers.add(Marker(markerId: MarkerId("CurrentLocation"),position: LatLng(position.latitude, position.longitude)));
                        setState(() {

                        });

                      },
                      child: Container(
                        height: 30.sp,
                          width: 30.sp,
                          decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(30.sp)),
                          child: Icon(Icons.my_location,color: AppColors.primary,))),
                ),
              ),

              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white54),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 14.sp),
                      child: AppBarWidget(),
                      
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Location services are disable");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permision denied");
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

}