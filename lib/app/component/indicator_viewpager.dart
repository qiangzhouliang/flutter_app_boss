import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget{
  DotsIndicator({this.controller, this.itemCount, this.onPageSelected, this.color}):super(listenable:controller);
  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  static const double _kDotSize = 5.0;
  static const double _kMaxZoom = 2.0;
  static const double _kDotSpacing = 15.0;

  Widget _buildDot(int index){
    double selectedness = Curves.easeOut.transform(
      max(0.0,1.0 - ((controller.page ?? controller.initialPage) - index).abs(),),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0)*selectedness;
    return new Container(
      width: _kDotSpacing,
      child: Material(
        color: color,
        type: MaterialType.circle,
        child: Container(
          width: _kDotSize*zoom,
          height: _kDotSize * zoom,
          child: InkWell(onTap: ()=>onPageSelected(index),),
        ),
      ),
    );
  }

  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class IndicatorViewPage extends StatefulWidget{
  final List<Widget> _pages;

  IndicatorViewPage(this._pages);

  @override
  State createState() => IndicatorViewPageState();
}

class IndicatorViewPageState extends State<IndicatorViewPage>{
  final _controller = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconTheme(
          data: IconThemeData(color: _kArrowColor),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemBuilder: (BuildContext context,int index){
                  return widget._pages[index % widget._pages.length];
                },
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: DotsIndicator(
                    controller: _controller,
                    itemCount: widget._pages.length,
                    onPageSelected: (int page){
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve
                      );
                    },
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

}