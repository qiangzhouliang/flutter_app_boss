import 'package:flutter/material.dart';

import 'app/component/icon_tab.dart';
import 'app/view/company/company_view.dart';
import 'app/view/jobs_view.dart';
import 'app/view/message_view.dart';
//过渡页
class HomePage extends StatefulWidget{
    @override
    _HomePageState createState() => _HomePageState();
}
const double kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MESSAGE = 2;
const int INDEX_MINE = 3;
Color kPrimaryColor = Color.fromARGB(255, 0, 215, 198);
//状态管理类
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
    //默认选中第0个
    int currentIndex = 0;
    TabController mController;
    VoidCallback onChanger;
    @override
    void initState() {
        super.initState();
        mController = TabController(initialIndex:currentIndex,length: 4, vsync: this);
        onChanger = (){
            //设置值的方式
            setState(() {
              currentIndex = this.mController.index;
            });
        };
        mController.addListener(onChanger);
    }
    @override
    void dispose() {
        super.dispose();
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            //选项卡试图
            body: TabBarView(
                children: <Widget>[
                    JobsTab(),CompanyTab(),MessageTab(),JobsTab()
                ],
                //绑定controller
                controller: mController,
            ),
            bottomNavigationBar: Material(
                color: Colors.white,
                child: TabBar(
                    controller: mController,
                    //指示条大小
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(fontSize: kTabTextSize),
                    tabs: <IconTab>[
                        IconTab(
                            text:'职位',
                            icon:currentIndex == INDEX_JOB ? "assets/images/ic_main_tab_find_pre.png":"assets/images/ic_main_tab_find_nor.png",
                            color:currentIndex == INDEX_JOB ? kPrimaryColor:Colors.grey[900],
                            ),
                        IconTab(
                            text:'公司',
                            icon:currentIndex == INDEX_COMPANY ? "assets/images/ic_main_tab_company_pre.png":"assets/images/ic_main_tab_company_nor.png",
                            color:currentIndex == INDEX_COMPANY ? kPrimaryColor:Colors.grey[900],
                        ),
                        IconTab(
                            text:'消息',
                            icon:currentIndex == INDEX_MESSAGE ? "assets/images/ic_main_tab_contacts_pre.png":"assets/images/ic_main_tab_contacts_nor.png",
                            color:currentIndex == INDEX_MESSAGE ? kPrimaryColor:Colors.grey[900],
                        ),
                        IconTab(
                            icon:currentIndex == INDEX_MINE ? "assets/images/ic_main_tab_my_pre.png":"assets/images/ic_main_tab_my_nor.png",
                            text:'我的',
                            color:currentIndex == INDEX_MINE ? kPrimaryColor:Colors.grey[900],
                        ),
                    ],
                ),
            ),
        );
    }

}