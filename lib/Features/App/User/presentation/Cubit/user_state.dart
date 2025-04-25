part of 'user_cubit.dart';

@immutable
class UserClassState {
  final bool loading;
  final String error;
  final bool? errorUser;

  final bool? success;
  final  List<geocoding.Placemark> ? place;
  final UserDataModel userDataModel;
  final List<AddressModel>? address;
  final Set<Marker> setMarkers;

  const UserClassState({
    required this.userDataModel,
    this.loading = false,
    this.error = '',
    this.address = const [],
    this.errorUser,
    this.success,
    this.place,
    this.setMarkers=const{}
  });

  UserClassState copyWith({
    bool? loading,
    String? message,
    String? error,
    bool? success,
    bool? errorUser,
    UserDataModel? userDataModel,
    List<AddressModel>? address,
    List<geocoding.Placemark> ? place,
    Set<Marker>? setMarkers
  }) {
    return UserClassState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      errorUser: errorUser ?? this.errorUser,
      success: success ?? this.success,
      userDataModel: userDataModel ?? this.userDataModel,
      address: address ?? this.address,
      place: place ?? this.place,
      setMarkers: setMarkers ?? this.setMarkers,
    );
  }
}
