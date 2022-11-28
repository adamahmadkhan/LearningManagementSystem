import 'package:flutter/material.dart';
import 'package:newloginpage/Student/StudentAppBarr.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  void initState() {
    // TODO: implement initState
    super.initState();
    SetNames();
  }
  String UserName="";
  String UserRoll="";
  String Profile="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        backgroundColor: Color(0xff000854),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff000250),
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
                    Text(UserRoll.toString(),style: TextStyle(fontWeight: FontWeight.w100,color: Colors.white),)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void SetNames (){
    UserName="Adam";
    UserRoll="Fa19";
    Profile="https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  }
}
