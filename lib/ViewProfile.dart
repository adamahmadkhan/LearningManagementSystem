import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:newloginpage/constraintsvalues.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        backgroundColor: const Color(0xff002b5c),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 40,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 80,
                        child: CircleAvatar(
                          backgroundColor: Colors.tealAccent,
                          backgroundImage: NetworkImage(Studentprofile),
                          radius: 75,
                        ),
                      ),
                      Text(
                        Studentname.toString().toUpperCase(),
                        style: TextStyle(
                        fontSize: fsize + 5, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person,color: Colors.black,size: fsize,),
                            Text("\t\tInfo",style: TextStyle(fontSize: fsize,color: Colors.black,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Name:\t"+Studentname),
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 10,),
                        Text("Roll Number:\t"+Studentrollnumber),
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(height: 10,),
                        Text("CNIC:\t"),
                        const Divider(
                          thickness: 2,
                        ),
                        Text("EMAIL:\t"+Studentemail),
                        const Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration:const BoxDecoration(
                        //color: Colors.tealAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.bar_chart,color: Colors.black,size: fsize,),
                              Text("\t\tAcademic Outlook",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Cgpa:\t3.7"),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(height: 10,),
                          Text("Projected Cpga:\t3.9"),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(height: 10,),
                          Text("Current Forecast:\t3.6"),
                          const Divider(
                            thickness: 2,
                          ),
                        ],)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.assignment,color: Colors.black,size: fsize,),
                              Text("\t\tAssignment Summery",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Active:\t3"),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(height: 7,),
                          Text("Pending:\t1"),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(height: 7,),
                          Text("Ending:\t8"),
                          const Divider(
                            thickness: 2,
                          ),
                          Text("Submitted:\t 3"),
                          const Divider(
                            thickness: 2,
                          ),
                        ],)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
