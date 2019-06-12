import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fboss/app/model/company.dart';
//公司信息
class CompanyInfo extends StatelessWidget{
  final Company company;

  CompanyInfo(this.company);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            children: <Widget>[
              //左侧logo信息
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 15.0,right: 15.0,bottom: 0.0),
                child: Image.network(company.logo,width: 50.0,height: 50.0,),
              ),
              //填充左侧剩余的右侧部分
              Expanded(
                child: Column(
                  //从上开始
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //公司名称
                    Container(
                      child: Text(company.name,textAlign: TextAlign.left,style: TextStyle(fontSize: 15,),),
                      //上下边距
                      margin: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                    ),

                    //公司位置
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,left: 0.0,right: 5.0,bottom: 5.0),
                      child: Text(company.location,style: TextStyle(fontSize: 13,color: Colors.grey),),
                    ),

                    //公司信息
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,left: 0.0,right: 5.0,bottom: 5.0),
                      child: Text(company.type+" | "+company.size+" | "+ company.employee,style: TextStyle(fontSize: 13,color: Colors.grey),),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}