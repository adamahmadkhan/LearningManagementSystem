import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:newloginpage/constraintsvalues.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students"),
        backgroundColor: Color(0xff002b5c),
       ),
      drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20,left: 20,right: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.tealAccent,
                        backgroundImage: NetworkImage(Studentprofile),
                        radius: 75,
                      ),
                    ),
                  ),
                  Expanded(child: Text(Studentname.toString().toUpperCase(),style: TextStyle(fontSize: fsize+5,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(
                height: 10,

              ),
              Text("BIO",style: TextStyle(fontSize: 25+fsize/3,fontWeight: FontWeight.bold),),
              Divider(
                thickness: 5,
                height: 20,
              ),
              Text("RollNumber: "+Studentrollnumber.toString().toUpperCase(),style: TextStyle(fontSize: fsize,fontWeight: FontWeight.bold),),
              Text("Phone: "+Studentphone.toString(),style: TextStyle(fontSize: fsize,fontWeight: FontWeight.bold),),
              Text("Email: "+Studentemail.toString(),style: TextStyle(fontSize: fsize,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
    );
  }
}
