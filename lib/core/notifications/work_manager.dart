import 'package:todo_app/core/notifications/local_notification.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  void registerTask() async {
    await Workmanager().registerPeriodicTask('id', 'wirte tasks',
        frequency: const Duration(hours: 12));
  }

  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    registerTask();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  //show notification
  Workmanager().executeTask((taskName, inputData) {
    LocalNotification.dialyNotification();
    return Future.value(true);
  });
}
