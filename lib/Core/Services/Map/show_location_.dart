import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../Features/client/common/User/presentation/Cubit/user_cubit.dart';

import 'Static/location_service.dart';

enum MapsOptional {
  myLocation(0),
  getMyLocationWithPoint(1),
  getMyLocationWithAddress(2),
  setMyLocationWithAddress(3);

  final int value;

  const MapsOptional(this.value);
}

class ShowMapLocation extends StatefulWidget {
  final String? address;
  final LatLng? points;

  const ShowMapLocation.point({super.key, this.points}) : address = null;

  const ShowMapLocation.address({super.key, this.address}) : points = null;

  @override
  State<ShowMapLocation> createState() => _ShowMapLocationState();
}

class _ShowMapLocationState extends State<ShowMapLocation> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.669593268876408, 30.789149139355608), // point of the map
    zoom: 6,
  );
  final Set<Marker> _markers = {};
  late LocationService locationService;
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserClassState>(
      builder: (context, state) {
        return GoogleMap(
          markers: _markers,
          buildingsEnabled: false,
          mapType: MapType.terrain,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) async {
            mapController = controller;
            final markAddress =
                await locationService.getDetailsAddressByAddress(
                    context.read<UserCubit>().defaultAddress);

            // final markPoints = widget.points == null
            //     ? null
            //     : locationService.getDetailsAddressByLatLong(
            //         latLng: widget.points!,
            //         isMyLocation: false,
            //       );
            mapController?.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    zoom: 17,
                    target: widget.points ??
                        LatLng(markAddress.first.latitude,
                            markAddress.first.longitude))));

            setState(() {});
          },
        );
      },
    );
  }
}
