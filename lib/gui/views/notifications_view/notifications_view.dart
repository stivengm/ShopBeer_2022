import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/blocs/notifications/notifications_bloc.dart';
import 'package:shopbeer/data/models/notifications_model.dart';
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
        return state.notifications!.isEmpty
            ? const NotificationsEmpyView()
            : ListView.builder(
              itemCount: state.notifications!.length,
                itemBuilder: (context, index) => _buildNotifications(state.notifications![index])
              );
      },
    );
  }

  Widget _buildNotifications(NotificationsModel? notification) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification!.title!, style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 20.0)),
          const SizedBox(height: 5.0),
          Text(notification.description!, style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15.0),),
        ],
      ),
    );
  }
}
