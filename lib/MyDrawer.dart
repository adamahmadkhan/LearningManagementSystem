import 'package:flutter/material.dart';
import 'package:newloginpage/LoginScreen.dart';
import 'package:newloginpage/Setting.dart';
import 'package:newloginpage/Student/StudentHome.dart';
import 'package:restart_app/restart_app.dart';

import 'constraintsvalues.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}



class _CustomDrawerState extends State<CustomDrawer> {

  @override
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
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const  Icon(
              Icons.home,
            ),
            title: Text('Home page', style: TextStyle(fontSize:fsize),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.update,
            ),
            title: Text('Update Profile',style: TextStyle(fontSize:fsize),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const  Icon(
              Icons.error,
            ),
            title: Text('Report An Error', style: TextStyle(fontSize:fsize),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text("Setting",style: TextStyle(fontSize:fsize),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: Text('Sign Out',style: TextStyle(fontSize:fsize),),
            onTap: () {
                Restart.restartApp();
            },
          ),
        ],
      ),
    );
  }
  void SetNames (){
      UserName="Adam";
      UserRoll="Fa19";
      Profile="https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  }
}

