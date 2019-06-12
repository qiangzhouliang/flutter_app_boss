import 'dart:async';
import 'package:flutter/material.dart';

import 'home.dart';
//过渡页
class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

//状态管理类
class _SplashPageState extends State<SplashPage>{
    Timer _t;
    @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(milliseconds: 1500), (){
        try{
            //跳转到首页
            Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) => HomePage(),),
                            (Route route) => route == null);
        }catch(e){

        }
    });
  }
  @override
  void dispose() {
    super.dispose();
    _t.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        //页面背景颜色
        color: Color.fromARGB(255, 0, 215, 198),
        //页面子元素
        child: Padding(
            //设置距离顶部为 150
            padding: const EdgeInsets.only(top: 150),
            child: Column(
                children: <Widget>[
                    Text('boss直聘',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
            ),
        ),
    );
  }

}