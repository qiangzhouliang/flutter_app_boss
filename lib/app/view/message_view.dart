import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/item/messagelist_item.dart';
import 'package:flutter_app_fboss/app/model/message.dart';
class MessageTab extends StatefulWidget{
  @override
  _MessageTabState createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab>{
    List<Message> messages = [];
    //UI试图展示
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 242, 245),
        appBar: AppBar(
          elevation: 0.0,
          title: Text('消息',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: buildJobItem,
        ),
      );
    }
    //条目内容，列表项
    Widget buildJobItem(BuildContext context,int index){
      Message msg = messages[index];
      //水波纹效果
      return InkWell(
        //点击事件
        onTap: (){
          showDialog(context: context,child: AlertDialog(
            content: Text('敬请期待！',style: TextStyle(fontSize: 20),),
          ));
        },
        child: MessageListItem(msg),
      );
    }
    //初始化数据
    @override
    void initState() {
      super.initState();
      getJobList();
    }

  void getJobList(){
      //在setState里面获取数据
      setState(() {
        messages = Message.fromJson("""
            {
                "list":[
                    {
                        "name" : "小可爱",
                        "avatar": "https://pic.cnblogs.com/face/994129/20161010114728.png",
                        "company" : "百度",
                        "position" : "兰州",
                        "msg" : "你好"
                    }       
                ]
            }
        """);
      });
  }
}