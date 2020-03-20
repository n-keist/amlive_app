import 'dart:io';

import 'package:amlive/views/home/publishview.dart';
import 'package:amlive/views/home/widgets/home.dart';
import 'package:amlive/views/home/widgets/panel.dart';
import 'package:amlive/views/home/streamview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeViewIndex extends StatefulWidget {
  @override
  _HomeViewIndexState createState() => _HomeViewIndexState();
}

class _HomeViewIndexState extends State<HomeViewIndex>
    with SingleTickerProviderStateMixin {
  PanelController _panelController = new PanelController();
  PageController _pageController = new PageController(
    initialPage: 1,
  );
  AnimationController _animationController;
  ScrollController _scrollController = new ScrollController();

  List<Widget> _pages = [];

  double _indexOpacity = 0.0;

  Widget _chat = Container();
  Widget _stream = Container();

  double _minHeight;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      value: 0,
    );
    _scrollController.addListener(() {
      if (_panelController.isPanelOpen &&
          _scrollController.position.pixels <= 0) {
        _panelController.close();
      }
    });

    _pageController.addListener(_pageScrollListener);

    setState(
      () {
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
      },
    );

    setState(() => _pages.add(HomeViewPublishView()));
    setState(() => _pages.add(_buildHome()));
    setState(() => _pages.add(HomeViewStreamView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('amlive'),
        centerTitle: true,
        leading: AnimatedOpacity(
          opacity: _indexOpacity,
          duration: Duration(milliseconds: 200),
          child: IconButton(
            icon: Icon(FeatherIcons.arrowLeft),
            onPressed: () => _pageController.animateToPage(
              1,
              duration: new Duration(milliseconds: 200),
              curve: Curves.easeOut,
            ),
          ),
        ),
      ),
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        color: ThemeData.light().scaffoldBackgroundColor,
        defaultPanelState: PanelState.CLOSED,
        minHeight: _minHeight ?? 0,
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
    return HomeWidgetPanel(
      animationController: _animationController,
      scrollController: _scrollController,
      panelController: _panelController,
    );
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        PageView.builder(
          itemCount: _pages.length,
          controller: _pageController,
          itemBuilder: (_buildContext, index) {
            return _pages[index];
          },
        ),
      ],
    );
  }

  void _onPanelSlide(double value) {
    _animationController.value = value / 0.5;
  }

  void _pageScrollListener() {
    double max = MediaQuery.of(context).size.height * 0.39,
        offset = _pageController.offset - 375;
    setState(() => _minHeight = offset < max ? offset >= 0 ? offset : 0 : max);
    setState(() => _indexOpacity = _pageController.page > 1 ? 1 : 0);
  }

  Widget _buildHome() {
    return HomeWidgetHome();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
    _animationController?.dispose();
  }
}
