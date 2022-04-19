import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';

class NotificationsWidget extends StatelessWidget {
  final String message;
  const NotificationsWidget({ Key? key, required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showNotificationSuccess(BuildContext context) => Flushbar(
    duration: const Duration(seconds: 2),
    icon: const Icon(
      Icons.check_circle_outline,
      color: whiteColor,
      size: 30.0,
    ),
    title: "Listo!",
    message: message,
    borderRadius: BorderRadius.circular(defaultPadding),
    backgroundColor: successColor.withOpacity(.7),
    barBlur: defaultPadding * 1.3,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);

  showNotificationError(BuildContext context) => Flushbar(
    duration: const Duration(seconds: 2),
    icon: const Icon(
      Icons.error,
      color: whiteColor,
      size: 30.0,
    ),
    title: "Error!",
    message: message,
    borderRadius: BorderRadius.circular(defaultPadding),
    backgroundColor: dangerColor.withOpacity(.7),
    barBlur: defaultPadding * 1.3,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);

}