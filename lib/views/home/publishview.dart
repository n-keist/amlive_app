import 'package:flutter/material.dart';
import 'package:flutter_rtmp/flutter_rtmp.dart';

class HomeViewPublishView extends StatefulWidget {
  @override
  _HomeViewPublishViewState createState() => _HomeViewPublishViewState();
}

class _HomeViewPublishViewState extends State<HomeViewPublishView> {
  RtmpManager _rtmpManager;

  @override
  void initState() {
    _rtmpManager = new RtmpManager(
      onCreated: () => print('rtmp created'),
    );
    _rtmpManager.permissionCheck().then((cameraPermission) =>
        (cameraPermission) ? _rtmpManager.switchCamera() : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _rtmpManager.view(),
    );
  }
}
