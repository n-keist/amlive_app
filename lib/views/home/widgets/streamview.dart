import 'package:flutter/material.dart';

class HomeViewStreamView extends StatefulWidget {
  @override
  _HomeViewStreamViewState createState() => _HomeViewStreamViewState();
}

class _HomeViewStreamViewState extends State<HomeViewStreamView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://loremflickr.com/320/240'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
