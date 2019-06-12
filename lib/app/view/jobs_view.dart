import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/app/item/joblist_item.dart';
import 'package:flutter_app_fboss/app/model/job.dart';
class JobsTab extends StatefulWidget{
  @override
  _JobsTabState createState() => _JobsTabState();

}

class _JobsTabState extends State<JobsTab>{
    List<Job> jobs = [];
    //UI试图展示
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 242, 245),
        appBar: AppBar(
          elevation: 0.0,
          title: Text('职位',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
        body: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: buildJobItem,
        ),
      );
    }
    //条目内容，列表项
    Widget buildJobItem(BuildContext context,int index){
      Job job = jobs[index];
      //水波纹效果
      return InkWell(
        //点击事件
        onTap: (){
          showDialog(context: context,child: AlertDialog(
            content: Text('敬请期待！',style: TextStyle(fontSize: 20),),
          ));
        },
        child: JobListItem(job),
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
        jobs = Job.fromJson("""
            {
                "list":[
                    {
                        "name" : "架构师（Android）",
                        "cname": "蚂蚁金服",
                        "size" : "B轮",
                        "salary" : "25k-45k",
                        "username" : "Claire",
                        "title" : "HR"
                    },
                    {
                        "name" : "资深Android架构师",
                        "cname": "今日头条",
                        "size" : "D轮",
                        "salary" : "40k-60k",
                        "username" : "Kimi",
                        "title" : "HRBP"
                    }        
                ]
            }
        """);
      });
  }
}