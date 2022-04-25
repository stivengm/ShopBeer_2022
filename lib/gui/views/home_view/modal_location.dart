import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopbeer/core/blocs/location/location_bloc.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class ModalLocation extends StatefulWidget {
  const ModalLocation({Key? key}) : super(key: key);

  @override
  State<ModalLocation> createState() => _ModalLocationState();
}

class _ModalLocationState extends State<ModalLocation> {
  @override
  Widget build(BuildContext context) {


    Size _media = MediaQuery.of(context).size;
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        final CameraPosition _kGooglePlex = CameraPosition(
          target: state.positionUser!,
          zoom: 14.4746,
        );
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            color: backgroundApp,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  width: _media.width * .2,
                  height: 4.0,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                Material(
                  color: backgroundApp,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Dirección o lugar',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: greyColor
                              ),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            filled: true,
                            fillColor: whiteColor,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Detalle apt / piso / casa',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: greyColor
                              ),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            filled: true,
                            fillColor: whiteColor,
                          ),
                        )
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                  child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                )),
                const SizedBox(height: 15.0),
                PrimaryButton(
                    text: 'Aceptar', onPressed: () => Navigator.pop(context)),
                const SizedBox(height: 20.0)
              ],
            ),
          ),
        );
      },
    );
  }
}
