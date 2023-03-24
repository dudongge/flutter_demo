import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:visibility_detector/visibility_detector.dart';

class HomeBanner extends StatefulWidget {
  final List<String> _images;
  final double height;

  // final ValueChanged<int> onTap;
  const HomeBanner(
    this._images, {
    super.key,
    this.height = 200,
  });

  @override
  State<HomeBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<HomeBanner> {
  late PageController _pageController;
  late int _curIndex;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _curIndex = widget._images.length;
    _pageController = PageController(initialPage: _curIndex);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    var length = widget._images.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget._images.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 8,
                height: 8,
                color: s == widget._images[_curIndex % length] ? Colors.white : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPageView() {
    var length = widget._images.length;
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _curIndex = index;
            if (index == 0) {
              _curIndex = length;
              _changePage();
            }
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('当前 page 为 ${index % length}');
              }
            },
            child: Image.network(
              widget._images[index % length],
              fit: BoxFit.fitWidth,
            ),
          );
        },
      ),
    );
  }

  _cancelTimer() {
    _timer.cancel();
  }

  _initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (t) {
      _curIndex++;
      _pageController.animateToPage(
        _curIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  _changePage() {
    Timer(const Duration(milliseconds: 350), () {
      _pageController.jumpToPage(_curIndex);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_timer.isActive) {
      _cancelTimer();
    }
    super.dispose();
  }
}
