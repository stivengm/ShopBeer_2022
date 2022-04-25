part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}


class LocationUser extends LocationEvent {
  final LatLng positionUser;
  const LocationUser(this.positionUser);
}