import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:newloginpage/Student/studentsNotifications.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  String UserName="";
  String UserRoll="";
  String Profile="";

  void initState() {
    // TODO: implement initState
    super.initState();
    SetNames();
  }
  List<studentsNotifications> StdNtfs=[];

  Future<List<studentsNotifications>> getPostApi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        StdNtfs.add(studentsNotifications.fromJson(i));
      }
      return StdNtfs ;
    }
    else
      {
        return StdNtfs;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        backgroundColor: Colors.teal,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60 ),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(Profile.toString()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(UserName.toString(),style: TextStyle(fontWeight:FontWeight.bold, color: Colors.white),),
                  Text(UserRoll.toString(),style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white),)
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
            ),

            Text("Notification", style: TextStyle(fontSize: 30),),
            FutureBuilder(
              future: getPostApi(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                    return const Text("LOADING DATA");
                }
                else{
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        itemCount: StdNtfs.length,
                          itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text(StdNtfs[index].title.toString()),
                                Text("Message",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text(StdNtfs[index].body.toString()),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            )
          ],
        ),
      ),
    );
  }
  void SetNames (){
    UserName="Adam Ahmad Khan";
    UserRoll="Fa19-Bcs-108";
    Profile="https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  }
}
