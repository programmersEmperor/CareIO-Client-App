import 'package:ai_health_assistance/Models/Notification.dart' as noti;
import 'package:ai_health_assistance/Services/Api/notification.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<noti.Notification> notifications = [
    noti.Notification(
        id: 1, title: 'Hello', body: "Hello", createdAt: "now", isRead: false),
    noti.Notification(
        id: 2, title: 'Hi', body: "Hi", createdAt: "2 min ago", isRead: true)
  ];

  final NotificationApiService _apiService = Get.find<NotificationApiService>();

  RxBool get isLoading => _apiService.isLoading;

  void fetchNotifications() async {
    var response = await _apiService.fetchNotifications(body: {'page': 1});
    if (response == null) return;

    for (var notification in response.data['result']['data']) {
      notifications.add(noti.Notification.fromJson(notification));
    }
  }
}
