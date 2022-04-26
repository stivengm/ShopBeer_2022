import 'package:flutter/material.dart';

class NotificationsEmpyView extends StatelessWidget {
  const NotificationsEmpyView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/resources/notifications.png', height: media.height * .4, width: double.infinity),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * .1),
          child: Column(
            children: [
              Text("No tienes ninguna notificación.", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20.0), textAlign: TextAlign.center),
            ],
          ),
        ),
        const SizedBox()
      ],
    );
  }
}