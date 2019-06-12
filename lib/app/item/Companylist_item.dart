import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/model/company.dart';
class CompanyListItem extends StatelessWidget{
    final Company company;
    //构造函数，传递参数
    CompanyListItem(this.company);
  @override
  Widget build(BuildContext context) {
    return Padding(
        //留了一点间距，上下为3 左右为5
        padding: const EdgeInsets.only(top: 3.0,left: 5.0,right: 5.0,bottom: 3.0),
        //可变大小的一个box
        child: SizedBox(
            //添加阴影效果
            child: Card(
                elevation: 0.0,
                //水平布局
                child: Row(
                    //次轴对齐方式，向开始位置对齐
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //孩子项
                    children: <Widget>[
                        //左边的logo
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 15.0,right: 15.0,bottom: 0.0),
                            child: Image.network(company.logo,width: 50.0,height: 50.0,),
                        ),
                        //此组件会填满Row在主轴方向的剩余空间，撑开Row
                        Expanded(
                            child: Column(
                                //从上开始
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                    //公司名称
                                    Container(
                                        child: Text(company.name,textAlign: TextAlign.left,style: TextStyle(fontSize: 15,),),
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
                                    //分割线
                                    Divider(),
                                    Row(
                                        children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(top: 5.0,left: 0.0,right: 5.0,bottom: 15.0),
                                                child: Text(
                                                    "热招： "+company.hot+" 等 "+company.count + "个职位",
                                                    style: TextStyle(fontSize: 10,color: Colors.grey),),
                                            ),
                                            //后面的全部填充
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                        Padding(
                                                            padding: const EdgeInsets.only(bottom: 8.0),
                                                            child: const Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ],
                                    )
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