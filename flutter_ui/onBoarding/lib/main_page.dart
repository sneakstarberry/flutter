import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:onBoarding/second_page.dart';

import 'third_page.dart';

class OnboardingClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff485563), Color(0xff29323c)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(
                  () {
                    currentPage = index;
                    if (currentPage == pageList.length - 1) {
                      lastPage = true;
                      animationController.forward();
                    } else {
                      lastPage = false;
                      animationController.reset();
                    }
                  },
                );
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;
                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                      print("${_controller.page}");
                      print("Y : $y $index");
                      print("Position : ${_controller.position.pixels}");
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(page.imageUrl),
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: 0.10,
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                    colors: pageList[index].titleGradient,
                                  ),
                                  style: TextStyle(
                                      fontSize: 100.0,
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 1.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 30.0,
                                  left: 22.0,
                                ),
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                      colors: page.titleGradient),
                                  style: TextStyle(
                                      fontSize: 70.0, fontFamily: 'Montserrat'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 34.0,
                            top: 12.0,
                          ),
                          child: Transform(
                            transform:
                                Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                            child: Text(
                              page.body,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff9b9b9b)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 50.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentPage, 3),
              ),
            ),
            Positioned(
              right: 30.0,
              bottom: 30,
              child: ScaleTransition(
                scale: animation,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
