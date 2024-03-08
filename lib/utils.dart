import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;

bool enableActivityTracking = false;
int logLevel = bg.Config.LOG_LEVEL_VERBOSE;

Future<void> resetGeolocation(String tag) async {
  await bg.BackgroundGeolocation.stop().then((bg.State state) {
    print('$tag[status] stopped: $state');
  });

  // Not required if you call Config(reset: true);
  await bg.BackgroundGeolocation.reset();
  print('[location][status][reset] done');

  await bg.BackgroundGeolocation.removeListeners();
  print('[location][status][listeners] removed');

  print('[location][status][stop] done');
}

void startLocationService(String tag) {
  bg.BackgroundGeolocation.start().then((bg.State state) {
    print('$tag[status] started: $state');
  });

  // Ignore Activity Recognition or it will not work on emulator
  // bg.BackgroundGeolocation.changePace(!enableActivityTracking).then((value) {
  //   print('$tag[changePace] activity recognition $value');
  // });
}

void logEvents(String tag) {
  bg.BackgroundGeolocation.onLocation((bg.Location location) {
    print('$tag[onLocation] $location');
  });

  bg.BackgroundGeolocation.onActivityChange((e) {
    print('$tag[onActivityChange] $e');
  });

  bg.BackgroundGeolocation.onHeartbeat((e) {
    print('$tag[onHeartbeat] $e');
  });

  bg.BackgroundGeolocation.onHttp((e) {
    print('$tag[onHttp] $e');
  });

  bg.BackgroundGeolocation.onMotionChange((l) {
    print('$tag[onMotionChange] $l');
  });

  bg.BackgroundGeolocation.onProviderChange((e) {
    print('$tag[onProviderChange] $e');
  });

  bg.BackgroundGeolocation.onGeofence((e) {
    print('$tag[onGeofence] $e');
  });

  bg.BackgroundGeolocation.onGeofencesChange((e) {
    print('$tag[onGeofencesChange] $e');
  });

  bg.BackgroundGeolocation.onSchedule((e) {
    print('$tag[onSchedule] $e');
  });

  bg.BackgroundGeolocation.onEnabledChange((e) {
    print('$tag[onEnabledChange] $e');
  });

  bg.BackgroundGeolocation.onConnectivityChange((e) {
    print('$tag[onConnectivityChange] $e');
  });

  bg.BackgroundGeolocation.onPowerSaveChange((e) {
    print('$tag[onPowerSaveChange] $e');
  });

  bg.BackgroundGeolocation.onNotificationAction((e) {
    print('$tag[onNotificationAction] $e');
  });

  bg.BackgroundGeolocation.onAuthorization((e) {
    print('$tag[onAuthorization] $e');
  });
}
