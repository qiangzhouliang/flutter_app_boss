import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/model/message.dart';

class MessageListItem extends StatelessWidget{
    final Message message;
    //构造函数，传递参数
    MessageListItem(this.message);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //添加阴影效果
        child: Card(
            elevation: 0.0,
            //表示一行
            child: Row(
                //孩子项
                children: <Widget>[
                    //左侧部分
                    Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 0),
                        //圆形头像
                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(message.avatar),
                        ),
                    ),
                    //右侧部分
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                                Container(
                                    child: Text(message.name,textAlign: TextAlign.left,style: TextStyle(fontSize: 15),),
                                    margin: const EdgeInsets.only(top: 10,bottom: 5.0),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 5.0,left: 0,right: 5,bottom: 5.0),
                                    child: Text(message.company+" | "+message.position,style: TextStyle(fontSize: 13,color: Colors.grey),),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 5.0,left: 0,right: 5,bottom: 5.0),
                                    child: Text(message.msg,style: TextStyle(fontSize: 13,color: Colors.grey),),
                                ),
                            ],
                        ),
                    )
                ],
            ),
        )
    );
  }

}