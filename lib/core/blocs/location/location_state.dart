part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LatLng? positionUser;
  const LocationState({
    this.positionUser
  });

  LocationState copyWith({
    LatLng? positionUser,
  }) => LocationState(
    positionUser: positionUser ?? this.positionUser
  );
  
  @override
  List<Object?> get props => [ positionUser ];
}

