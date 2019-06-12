import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

 //公司简介
class CompanyInc extends StatelessWidget{
  final String companyInc;

  CompanyInc(this.companyInc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              //公司介绍
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Text('公司介绍',style: TextStyle(fontSize: 15.0),),
                  )
                ],
              ),
              //公司内容
              RichText(
                text: TextSpan(text: companyInc, style: TextStyle(fontSize: 13.0,color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}