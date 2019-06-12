import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/model/job.dart';
class JobListItem extends StatelessWidget{
    final Job job;
    //构造函数，传递参数
    JobListItem(this.job);
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
                //起了向左靠的效果，表示一行
                child: Row(
                    //次轴对齐方式，向开始位置对齐
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //孩子项
                    children: <Widget>[
                        //此组件会填满Row在主轴方向的剩余空间，撑开Row
                        Expanded(
                            child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                    Row(
                                        children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(top: 4,left: 10,bottom: 5),
                                                child: Text(job.name),
                                            ),
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                        Padding(
                                                            padding: const EdgeInsets.only(right: 10),
                                                            child: Text(job.salary,style: TextStyle(color: Colors.red),),
                                                        )
                                                    ],
                                                ),
                                            )
                                        ],
                                    ),
                                    Container(
                                        child: Text(job.cname+' '+job.size,textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.grey),),
                                        margin: const EdgeInsets.only(top: 5.0,left: 10.0,bottom: 5.0),
                                    ),
                                    //分割线
                                    Divider(),
                                    Row(
                                        children: <Widget>[
                                            Padding(padding: const EdgeInsets.only(top: 5.0,left: 10.0,right: 5.0,bottom: 15.0),
                                                child: Text(job.username+' | '+job.title,style: TextStyle(color: Color.fromARGB(255, 0, 215, 198)),),
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