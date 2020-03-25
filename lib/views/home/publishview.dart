import 'dart:async';
import 'dart:io';

import 'package:amlive/views/home/widgets/stream_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        timer = Timer(Duration(milliseconds: 100), () async {
          _uiView = UiKitView(
            viewType: 'LiveView',
            onPlatformViewCreated: (_) {
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
        Positioned(
          top: height * 0.85 - MediaQuery.of(context).padding.bottom,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 3.5,
              children: <Widget>[
                HomeWidgetStreamControl(
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
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
      ],
    );
  }
}
