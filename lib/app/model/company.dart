import 'dart:convert';
import 'package:meta/meta.dart';
//公司模块-数据模型类
class Company{
    final String logo;
    final String name;
    final String location;
    //公司性质
    final String type;
    //公司规模
    final String size;
    //公司人数
    final String employee;
    //热招职位
    final String hot;
    //职位总数
    final String count;
    //公司详情
    final String inc;


    Company({
        @required this.logo,
        @required this.name,
        @required this.location,
        @required this.type,
        @required this.size,
        @required this.employee,
        @required this.hot,
        @required this.count,
        @required this.inc
    });

  static List<Company> fromJson(String json){
      List<Company> _company = [];
      //解析json
      JsonDecoder decoder = JsonDecoder();
      //转换json数据
      List mapData = decoder.convert(json)['list'];
      mapData.forEach((obj){
          Company company = Company(
              logo: obj['logo'],
              name: obj['name'],
              location: obj['location'],
              type: obj['type'],
              size: obj['size'],
              employee: obj['employee'],
              hot: obj['hot'],
              count: obj['count'],
              inc: obj['inc'],
          );
          _company.add(company);
      });
      return _company;
  }

}