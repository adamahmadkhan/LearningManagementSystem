import 'package:flutter/material.dart';

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
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.library_books,
            ),
            title: const Text('Courses'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.developer_board_rounded,
            ),
            title: const Text("Marks"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
            ),
            title: const Text('Fee Structure'),
          ),
          ListTile(
            leading: Icon(
              Icons.grade,
            ),
            title: const Text('Assignments'),
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

