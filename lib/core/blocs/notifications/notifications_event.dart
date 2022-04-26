part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class SaveNotifications extends NotificationsEvent {
  final List<NotificationsModel>? notifications;
  const SaveNotifications(this.notifications);
}

class HandleLoading extends NotificationsEvent {
  final bool isLoading;
  const HandleLoading(this.isLoading);
}