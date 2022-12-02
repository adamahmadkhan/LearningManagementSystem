import 'package:flutter/material.dart';
import 'package:newloginpage/Setting.dart';

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
            leading: const Icon(
              Icons.update,
            ),
            title: const Text('Update Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const  Icon(
              Icons.error,
            ),
            title: const Text('Report An Error'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text("Setting"),
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
            title: const Text('Sign Out'),
            onTap: () {
              Navigator.pop(context);
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

