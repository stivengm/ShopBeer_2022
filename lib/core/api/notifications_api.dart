import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopbeer/core/paths/endpoints_path.dart';
import 'package:shopbeer/data/models/notifications_model.dart';

class NotificationsApi {

  Future<List<NotificationsModel>?> getNotifications() async {
    var url = Uri.https(EndpointPath.endPoint, EndpointPath.notifications);
    List<NotificationsModel> notifications = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonProductsModel = jsonDecode(response.body);
      final List<NotificationsModel> notificationsModel = jsonProductsModel.map<NotificationsModel>((m) => NotificationsModel.fromJson(Map<String, dynamic>.from(m))).toList();
      notifications = notificationsModel;
    }
    return notifications;
  }

}