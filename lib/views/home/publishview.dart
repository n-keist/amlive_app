import 'package:flutter/material.dart';

class HomeViewPublishView extends StatefulWidget {
  @override
  _HomeViewPublishViewState createState() => _HomeViewPublishViewState();
}

class _HomeViewPublishViewState extends State<HomeViewPublishView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: UiKitView(viewType: 'NativeView'),
      ),
    );
  }
}
