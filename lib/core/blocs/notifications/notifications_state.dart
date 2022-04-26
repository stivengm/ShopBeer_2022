part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final List<NotificationsModel>? notifications;
  final bool? isLoading;
  const NotificationsState({
    notifications,
    this.isLoading = true
  }) : notifications = notifications ?? const [];

  NotificationsState copyWith({
    List<NotificationsModel>? notifications,
    bool? isLoading,
  }) => NotificationsState(
    notifications: notifications ?? this.notifications,
    isLoading: isLoading ?? this.isLoading
  );
  
  @override
  List<Object?> get props => [ notifications, isLoading ];
}
