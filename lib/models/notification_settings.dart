part of '../main.dart';

class NotificationSettings {
  NotificationSettings({
    required this.notificationsEnabled,
    required this.notifyNewMatches,
    required this.notifyHighValueOnly,
    required this.minimumValueThreshold,
    required this.quietHoursEnabled,
    required this.quietStart,
    required this.quietEnd,
    required this.notifyDuplicates,
    required this.notifyWorthwhileRoute,
  });

  bool notificationsEnabled;
  bool notifyNewMatches;
  bool notifyHighValueOnly;
  double minimumValueThreshold;
  bool quietHoursEnabled;
  String quietStart;
  String quietEnd;
  bool notifyDuplicates;
  bool notifyWorthwhileRoute;
}
