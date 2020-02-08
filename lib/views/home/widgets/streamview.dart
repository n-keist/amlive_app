import 'package:flutter/material.dart';

class HomeViewStreamView extends StatefulWidget {
  @override
  _HomeViewStreamViewState createState() => _HomeViewStreamViewState();
}

class _HomeViewStreamViewState extends State<HomeViewStreamView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://loremflickr.com/600/600'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
