import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class ModalLocation extends StatelessWidget {
  const ModalLocation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    Size _media = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            width: _media.width * .2,
            height: 4.0,
            margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0)
            ),
          ),
          // const Expanded(
          //   child: GoogleMap(
          //     mapType: MapType.hybrid,
          //     initialCameraPosition: _kGooglePlex,
          //   )
          // ),
          const SizedBox(height: 15.0),
          PrimaryButton(text: 'Aceptar', onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}