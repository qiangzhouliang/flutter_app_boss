import 'package:flutter/material.dart';
///我的页面
class MineTab extends StatelessWidget{
  final double _appBarHeight = 150.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      //CustomScrollView 可以滚动
      body: CustomScrollView(
        slivers: <Widget>[
          //头像部分
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                //可变的
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      //渐变的效果
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[const Color(0x00000000),const Color(0x00000000)],
                      )
                    ),
                  ),
                  //头像部分
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 30.0,right: 20.0,),
                        //圆形头像
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage('https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4260706319,2257405356&fm=85&app=63&f=JPG?w=121&h=75&s=CFC59342F4A2B8BEBEBB445B0300C09A'),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,),
                                //圆形头像
                                child: Text('哆啦a梦',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),

                              Text('在职-考虑机会',style: TextStyle(color: Colors.white,fontSize: 18),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  //面试信息

                ],
              ),
            ),
          ),

          //面试部分
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,),
                    child: Row(
                      //圆形边排列
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _ContactItem(
                          onPressed: (){
                            showDialog(context: context,child: AlertDialog(
                              content: Text('沟通过',style: TextStyle(fontSize: 20.0,),),
                            ));
                          },
                          count: '590',
                          title: '沟通过',
                        ),

                        _ContactItem(
                          onPressed: (){
                            showDialog(context: context,child: AlertDialog(
                              content: Text('已沟通',style: TextStyle(fontSize: 20.0,),),
                            ));
                          },
                          count: '71',
                          title: '已沟通',
                        ),

                        _ContactItem(
                          onPressed: (){
                            showDialog(context: context,child: AlertDialog(
                              content: Text('待面试',style: TextStyle(fontSize: 20.0,),),
                            ));
                          },
                          count: '0',
                          title: '待面试',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///沟通信息
class _ContactItem extends StatelessWidget{
  _ContactItem({Key key,this.count,this.title,this.onPressed}):super(key:key);
  final String count;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    //有个按下的效果
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(count,style: TextStyle(fontSize: 22.0,),),
          ),
          Text(title),
        ],
      ),
    );
  }


}