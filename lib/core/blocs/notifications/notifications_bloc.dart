import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopbeer/core/api/notifications_api.dart';
import 'package:shopbeer/data/models/notifications_model.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super( const NotificationsState() ) {
    on<SaveNotifications>((event, emit) {
      emit( state.copyWith(notifications: event.notifications) );
    });

    on<HandleLoading>((event, emit) {
      emit( state.copyWith(isLoading: event.isLoading) );
    });
  }

  Future getNotifications() async {

    final response = await NotificationsApi().getNotifications();

    for (var item in response!) {
      if (item.show!) {
        add( SaveNotifications(response) );
      }
    }

    add( const HandleLoading(false) );

  }

}
