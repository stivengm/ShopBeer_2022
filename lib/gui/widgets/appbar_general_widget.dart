import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/gui/constants.dart';

class AppBarGeneralWidget extends StatelessWidget with PreferredSizeWidget {
  final String? titleAppbar;
  final bool? actions;
  const AppBarGeneralWidget({ Key? key, this.titleAppbar, this.actions = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleAppbar ?? ''),
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg', color: whiteColor,),
        onPressed: () => ZoomDrawer.of(context)!.toggle()
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded
          ),
          onPressed: () => Navigator.pushNamed(context, 'notifications'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}