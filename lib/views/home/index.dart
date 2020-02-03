import 'dart:io';

import 'package:amlive/views/home/widgets/badge.dart';
import 'package:amlive/views/home/widgets/message.dart';
import 'package:amlive/views/home/widgets/send_button.dart';
import 'package:amlive/views/home/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeViewIndex extends StatefulWidget {
  @override
  _HomeViewIndexState createState() => _HomeViewIndexState();
}

class _HomeViewIndexState extends State<HomeViewIndex>
    with SingleTickerProviderStateMixin {
  PanelController _panelController = new PanelController();
  PageController _pageController = new PageController();
  AnimationController _animationController;
  ScrollController _scrollController = new ScrollController();

  Widget _chat = Container();
  Widget _stream = Container();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      value: 0,
    );
    _scrollController.addListener(() {
      if (_panelController.isPanelOpen &&
          _scrollController.position.pixels <= 0) {
        _panelController.close();
      }
    });

    setState(() {
      _chat = Center(
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
      _stream = Center(
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('amlive.me'),
        centerTitle: true,
      ),
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        color: ThemeData.light().scaffoldBackgroundColor,
        defaultPanelState: PanelState.CLOSED,
        minHeight: MediaQuery.of(context).size.height * 0.39,
        maxHeight: MediaQuery.of(context).size.height * 0.77,
        isDraggable: true,
        panelSnapping: true,
        parallaxEnabled: true,
        animationDuration: 200,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        onPanelSlide: _onPanelSlide,
        panel: _panel(),
        body: _body(),
      ),
    );
  }

  Widget _panel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(text: '#noko'),
                    TextSpan(
                      text: ' is chatting',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: RotationTransition(
                  turns: Tween(
                    begin: 0.0,
                    end: 0.5,
                  ).animate(_animationController),
                  child: Icon(Icons.arrow_upward),
                ),
                onPressed: _togglePanel,
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(0, -10),
          child: Wrap(
            spacing: 4.0,
            children: <Widget>[
              HomeWidgetBadge(
                Colors.green[100],
                Colors.green,
                '2.3k',
                icon: Icons.remove_red_eye,
              ),
              HomeWidgetBadge(
                Colors.blue[100],
                Colors.blue,
                '12.3k',
                icon: Icons.person,
              ),
            ],
          ),
        ),
        Container(
          height: 35.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: HomeWidgetTextField(),
              ),
              Expanded(
                flex: 2,
                child: HomeWidgetSendButton(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 20,
            reverse: false,
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            itemBuilder: (buildContext, index) {
              return HomeWidgetMessage(
                'https://loremflickr.com/100/100/cat',
                'k3vin$index',
                'brudi nicer stream ',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        PageView.builder(
          itemCount: 2,
          controller: _pageController,
          itemBuilder: (buildContext, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/624/832',
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
            );
          },
        ),
        Positioned(
          right: 8.0,
          bottom: (MediaQuery.of(context).size.height * 0.39) + 90,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Color(0xff32292f),
            child: SvgPicture.asset(
              'assets/icons/heart-black.svg',
              height: 20,
              width: 20,
              color: Color(0xff32292f),
            ),
            onPressed: () => null,
          ),
        ),
      ],
    );
  }

  void _onPanelSlide(double value) {
    double max = 0.5;
    _animationController.value = value / max;
  }

  void _togglePanel() {
    if (_panelController.isAttached) {
      if (_panelController.isPanelClosed) {
        _panelController.animatePanelToPosition(1.0);
        _animationController.forward();
      } else {
        _panelController.animatePanelToPosition(0.0);
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
    _animationController?.dispose();
  }
}
