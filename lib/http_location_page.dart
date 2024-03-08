import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:spike_transistor_sdk/utils.dart';
import 'package:spike_transistor_sdk/web_server.dart';

const _tag = '[location][http]';

class HttpLocationPage extends StatefulWidget {
  const HttpLocationPage({super.key});

  @override
  State<HttpLocationPage> createState() => _HttpLocationPageState();
}

const _port = 8080;

class _HttpLocationPageState extends State<HttpLocationPage> {
  StreamSubscription<BasicRequest>? _subscription;
  bool registered = false;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    print('$_tag[status] running http config');

    _setupBackgroundLocation();

    super.initState();
  }

  void _setupBackgroundLocation() {
    bg.BackgroundGeolocation.ready(bg.Config(
      // HTTP request
      url: "http://myserver.com/gps",
      headers: {},
      params: {},
      extras: {},

      // Running setup
      foregroundService: true,
      stopOnTerminate: false,
      startOnBoot: true,
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
      reset: true,

      // Logging
      debug: true,
      logLevel: logLevel,

      disableElasticity: true,
      distanceFilter: 0,
      heartbeatInterval: 60,
      preventSuspend: true,
      locationUpdateInterval: 300,

      // Filters
      stopTimeout: 360,
      disableMotionActivityUpdates: true,
      allowIdenticalLocations: true,
      useSignificantChangesOnly: false,
      activityRecognitionInterval: 10000,
      isMoving: true,
    )).then((bg.State state) {
      print('$_tag[status] http config status: $state');

      startLocationService(_tag);
    });

    logEvents(_tag);
  }

  @override
  void dispose() {
    resetGeolocation(_tag);

    _subscription?.cancel();
    _controller.dispose();

    print('$_tag[status] disposed');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Requests are been done...'),
      ),
    );
  }
}
