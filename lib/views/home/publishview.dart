import 'dart:async';
import 'dart:io';

import 'package:amlive/views/home/widgets/stream_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeViewPublishView extends StatefulWidget {
  @override
  _HomeViewPublishViewState createState() => _HomeViewPublishViewState();
}

class _HomeViewPublishViewState extends State<HomeViewPublishView> {
  bool _permissionStatus = false;
  Widget _uiView = Center(
    child: Platform.isIOS
        ? CupertinoActivityIndicator()
        : SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ),
  );

  Widget _liveAction;
  MethodChannel _methodChannel;

  @override
  void initState() {
    super.initState();

    MethodChannel mediaPermissionChannel = MethodChannel('media.permission');
    mediaPermissionChannel.invokeMethod('requestAccess').then((result) {
      bool videoAccess = result['video'] as bool,
          audioAccess = result['audio'] as bool;
      _permissionStatus = videoAccess;
      setState(() {});
      if (videoAccess) {
        Timer timer;
        timer = Timer(Duration(milliseconds: 500), () async {
          _uiView = UiKitView(
            viewType: 'LiveView',
            onPlatformViewCreated: (_) {
              _methodChannel = MethodChannel('amlive.live');
              timer.cancel();
              timer = null;
            },
          );
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          child: SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: !_permissionStatus
                ? Center(
                    child: Text('Berechtigungen prüfen'),
                  )
                : SizedBox(
                    height: 400,
                    width: 350,
                    child: _uiView,
                  ),
          ),
        ),
        Positioned(
          top: height * 0.355,
          right: 0,
          child: _liveAction ?? _goLiveButton(),
        ),
      ],
    );
  }

  Widget _stopLiveButton() => InkWell(
        child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(
            right: 8.0,
          ),
          child: Center(
            child: Icon(
              FeatherIcons.x,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        onTap: _stopStream,
      );

  Widget _goLiveButton() => InkWell(
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          margin: const EdgeInsets.only(
            right: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Go Live',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        onTap: _initializeStream,
      );

  void _initializeStream() async {
    setState(() => _liveAction = _stopLiveButton());
    dynamic result = await _methodChannel?.invokeMethod('initialize');
    print(result);
  }

  void _stopStream() {
    setState(() => _liveAction = _goLiveButton());
  }
}
