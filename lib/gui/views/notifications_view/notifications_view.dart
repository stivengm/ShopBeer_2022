import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/blocs/notifications/notifications_bloc.dart';
import 'package:shopbeer/gui/views/notifications_view/notifications_empy_view.dart';
import 'package:shopbeer/gui/widgets/loading_app_widget.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getNotifications();
  }

  Future getNotifications() async {
    final notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
    await notificationsBloc.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state.isLoading! ? const LoadingAppWidget() : _body(),
        );
      },
    );
  }

  Widget _body() {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return state.notifications!.isNotEmpty
            ? _buildNotifications()
            : const NotificationsEmpyView();
      },
    );
  }

  Widget _buildNotifications() {
    return Container();
  }
}
