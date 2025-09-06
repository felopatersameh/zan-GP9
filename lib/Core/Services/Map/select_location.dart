import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../Config/Routes/route_name.dart';
import '../../Resources/app_colors.dart';
import '../../Utils/Extensions/localizations_extension.dart';

import '../../../Features/Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../Features/App/User/presentation/Cubit/user_cubit.dart';
import '../../../main.dart';
import '../../../Config/Assets/image_png.dart';
import 'custom_icon_maps.dart';
import 'location_service.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({
    super.key,
  });

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.669593268876408, 30.789149139355608), // point of the map
    zoom: 6,
  );
  LocationService locationService = LocationService();
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserClassState>(
      builder: (context, state) {
        return Scaffold(
          body: GoogleMap(
            markers: state.setMarkers,
            buildingsEnabled: false,
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            onTap: (argument) async {
              mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: argument, zoom: 17),
                ),
              );

              final myMarker = await CustomIconMaps.getImageFromRawData(
                  AppImagesPng.markerLocation, 100);
              var marker = Marker(
                  markerId: MarkerId('MyLocation'),
                  position: argument,
                  icon: BitmapDescriptor.bytes(myMarker));
                    if(!context.mounted) return;

              context.read<UserCubit>().addMark(marker);
              context.read<UserCubit>().selectAddress(argument);
            },
            onMapCreated: (GoogleMapController controller) async {
              mapController = controller;
              var data = await locationService.getLocation();
              final myMarker = await CustomIconMaps.getImageFromRawData(
                  AppImagesPng.markerLocation, 100);

              var marker = Marker(
                  markerId: MarkerId('MyLocation'),
                  position: LatLng(data.latitude!, data.longitude!),
                  icon: BitmapDescriptor.bytes(myMarker));
                    if(!context.mounted) return;

              context.read<UserCubit>().addMark(marker);
              mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(data.latitude!, data.longitude!),
                      zoom: 17),
                ),
              );
              
              context
                  .read<UserCubit>()
                  .selectAddress(LatLng(data.latitude!, data.longitude!));
            },
          ),
          floatingActionButton: CustomBuildButtonApp(
              text: context.local.Confirm,
              isSpace: false,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                kNavigationService.replaceWith(AppRoutes.addAddressScreen);
              }),
        );
      },
    );
  }
}
