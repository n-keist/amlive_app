import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeViewPublishView extends StatefulWidget {
  @override
  _HomeViewPublishViewState createState() => _HomeViewPublishViewState();
}

class _HomeViewPublishViewState extends State<HomeViewPublishView> {
  bool _permissionStatus = false;

  @override
  void initState() {
    super.initState();

    MethodChannel mediaPermissionChannel = MethodChannel('media.permission');
    mediaPermissionChannel.invokeMethod('requestAccess').then((result) {
      _permissionStatus = result['audio'] && result['video'];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: _permissionStatus
            ? Center(
                child: Text('Berechtigungen prüfen'),
              )
            : UiKitView(viewType: 'PublishingView'),
      ),
    );
  }
}
