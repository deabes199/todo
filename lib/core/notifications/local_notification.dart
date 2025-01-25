import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:todo_app/feathers/home/data/model/task_model.dart';

// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest_all.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // static StreamController<NotificationResponse> streamController =
  //     StreamController();
  static onTap(NotificationResponse response) {
    // streamController.add(response);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveBackgroundNotificationResponse: onTap,
        onDidReceiveNotificationResponse: onTap);
  }

  static void taskNotifications(
      {required TaskModel model,
      required DateTime currntDate,
      required TimeOfDay time}) async {
    tz.initializeTimeZones();
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        '1', 'add_task',
        importance: Importance.max, priority: Priority.high);
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    NotificationDetails details = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      model.id ?? 0,
      model.title,
      model.body,
      tz.TZDateTime(
        tz.local,
        currntDate.year,
        currntDate.month,
        currntDate.day,
        time.hour,
        time.minute,
      ).subtract(const Duration(minutes: 1)),
      payload: '${model.title}+ ${model.body}',
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static void dialyNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        'daily', 'daily_cha',
        importance: Importance.high, priority: Priority.max);
    NotificationDetails details = NotificationDetails(android: android);
    tz.initializeTimeZones();
    String currentTimezone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimezone));
    var currentTime = tz.TZDateTime.now(tz.local);
    var dailyTime = tz.TZDateTime(
        tz.local, currentTime.year, currentTime.month, currentTime.day, 21);
    if (dailyTime.isBefore(currentTime)) {
      dailyTime = dailyTime.add(const Duration(days: 1));
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      10,
      'Daily',
      'Write your task',
      dailyTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }
}
