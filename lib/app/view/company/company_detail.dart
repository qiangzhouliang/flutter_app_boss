import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/model/company.dart';
import 'package:flutter_app_fboss/app/view/company/company_hot_job.dart';
import 'package:flutter_app_fboss/app/view/company/company_inc.dart';
import 'package:flutter_app_fboss/app/view/company/company_info.dart';
import 'package:flutter_app_fboss/app/component/indicator_viewpager.dart';

const double _kAppBarHeight = 256.0;
//公司详情
class CompanyDetail extends StatefulWidget{
  final Company company;

  CompanyDetail(this.company);

  @override
  _CompanyDetailState createState() => _CompanyDetailState();

}
class _CompanyDetailState extends State<CompanyDetail> with TickerProviderStateMixin{
  List<Widget> imagePages;
  List<Tab> tabs;
  //控制器
  TabController controllers;
  List<String> urls = [
    'https://tp.85814.com/d/file/shutu/2018-02/20150214032040924.jpg',
    'https://tp.85814.com/d/file/shutu/2017-10/a13q10gfhjm.jpg',
    'https://tp.85814.com/d/file/meinv/2017-02-19/0-u6qoCsD.jpg'
  ];
  Widget companyTabContent;
  VoidCallback onChanged;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      //层叠组件
      body: Stack(
        children: <Widget>[
          //单一可滚动试图组件
          SingleChildScrollView(
            child: Column(
               children: <Widget>[
                 //三个轮播图片
                 SizedBox.fromSize(
                   size: const Size.fromHeight(_kAppBarHeight),
                   child: IndicatorViewPage(imagePages),
                 ),

                 Container(
                   color: Colors.white,
                   child: Column(
                     children: <Widget>[
                       CompanyInfo(widget.company),
                       Divider(),
                       TabBar(
                         indicatorWeight: 3.0,
                         indicatorSize: TabBarIndicatorSize.tab,
                         labelStyle: TextStyle(fontSize: 16.0),
                         labelColor: Colors.black,
                         controller: controllers,
                         tabs: tabs,
                         indicatorColor: Theme.of(context).primaryColor,
                       )
                     ],
                   ),
                 ),

                 companyTabContent
               ],
            ),
          ),

          Positioned(
            top: 10.0,
            left: -10.0,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              //返回按钮
              child: BackButton(color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if(urls.isNotEmpty){
      imagePages = <Widget>[];
      urls.forEach((url){
        imagePages.add(
          Container(
            color: Colors.black.withAlpha(900),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.network(url,fit: BoxFit.cover,height: _kAppBarHeight,),
            ),
          )
        );
      });
    }
    //选项卡
    tabs = [Tab(text: '公司概况',), Tab(text: '热招职位',)];
    //默认初始化为公司简介
    companyTabContent = CompanyInc(widget.company.inc);
    controllers = TabController(length: tabs.length, vsync: this);
    onChanged = (){
      setState(() {
        if(currentIndex == 0){
          companyTabContent = CompanyInc(widget.company.inc);
        }else{
          companyTabContent = CompanyHotJob();
        }
        currentIndex = this.controllers.index;
      });
    };
    controllers.addListener(onChanged);
  }

  //销毁的时候
  @override
  void dispose() {
    controllers.removeListener(onChanged);
    controllers.dispose();
    super.dispose();
  }
}