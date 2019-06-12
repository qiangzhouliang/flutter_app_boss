import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/item/Companylist_item.dart';
import 'package:flutter_app_fboss/app/model/company.dart';
import 'package:flutter_app_fboss/app/view/company/company_detail.dart';
class CompanyTab extends StatefulWidget{
  @override
  State createState() => _CompanyTabTabState();

}

class _CompanyTabTabState extends State<CompanyTab>{
    List<Company> companys = [];
    //UI试图展示
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 242, 245),
        appBar: AppBar(
          elevation: 0.0,
          title: Text('公 司',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
        body: ListView.builder(
          itemCount: companys.length,
          itemBuilder: buildCompanyItem,
        ),
      );
    }
    //条目内容，列表项
    Widget buildCompanyItem(BuildContext context,int index){
      Company company = companys[index];
      //水波纹效果
      return InkWell(
        //点击事件
        onTap: () => navCompanyDetail(company, index),
        child: CompanyListItem(company),
      );
    }
    //初始化数据
    @override
    void initState() {
      super.initState();
      getCompanyList();
    }

  void getCompanyList(){
      //在setState里面获取数据
      setState(() {
        companys = Company.fromJson("""
            {
                "list":[
                    {
                        "logo" : "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1820742796,3911586740&fm=58&w=121&h=140&img.JPEG",
                        "name": "蚂蚁金服信息技术有限公司",
                        "location" : "上海市浦东区",
                        "type" : "互联网",
                        "size" : "B轮",
                        "employee" : "10000人以上",
                        "hot" : "资深开放产品技术工程师",
                        "count" : "500",
                        "inc" : "蚂蚁金服是一家旨在为世界带来普惠金融服务的科技企业。蚂蚁金服起步于 2004 年成立的支付宝。2014 年 10 月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来更多平等的机会”为使命，致力于通过科技创新能力，搭建一个开放、共享的信用体系和金融服务平台，为全球消费者和小微企业提供安全、便捷的普惠金融服务。"
                    },
                    {
                        "logo" : "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1820742796,3911586740&fm=58&w=121&h=140&img.JPEG",
                        "name": "蚂蚁金服信息技术有限公司",
                        "location" : "上海市浦东区",
                        "type" : "互联网",
                        "size" : "B轮",
                        "employee" : "10000人以上",
                        "hot" : "资深开放产品技术工程师",
                        "count" : "500",
                        "inc" : "蚂蚁金服是一家旨在为世界带来普惠金融服务的科技企业。蚂蚁金服起步于 2004 年成立的支付宝。2014 年 10 月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来更多平等的机会”为使命，致力于通过科技创新能力，搭建一个开放、共享的信用体系和金融服务平台，为全球消费者和小微企业提供安全、便捷的普惠金融服务。"
                    }        
                ]
            }
        """);
      });
  }
  //跳转
  navCompanyDetail(Company company,int index){
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context,_,__){
          return new CompanyDetail(company);
        },
        transitionsBuilder: (_,Animation<double> animation,__,Widget child){
          //动画
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero
              ).animate(animation),child: child,),
          );
        }
      ));
  }
}