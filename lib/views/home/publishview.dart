import 'dart:async';
import 'dart:io';

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
        timer = Timer(Duration(milliseconds: 100), () {
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
    return Container(
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
    );
  }
}
