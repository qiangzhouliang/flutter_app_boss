import 'dart:convert';
import 'package:meta/meta.dart';
//消息模型类
class Message{
    final String name;
    final String avatar;
    final String company;
    final String position;
    final String msg;

    Message({@required this.name, @required this.avatar, @required this.company, @required this.position, @required this.msg});

  static List<Message> fromJson(String json){
      List<Message> _message = [];
      //解析json
      JsonDecoder decoder = JsonDecoder();
      List mapData = decoder.convert(json)['list'];
      mapData.forEach((obj){
          Message message = Message(
              name: obj['name'],
              avatar: obj['avatar'],
              company: obj['company'],
              position: obj['position'],
              msg: obj['msg'],
          );
         _message.add(message);
      });
      return _message;
  }

}