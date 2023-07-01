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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
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
                        Text(
                          "Info",
                          style: TextStyle(
                              fontSize: 25 + fsize / 3, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "RollNumber: " + Studentrollnumber.toString().toUpperCase(),
                          style:
                              TextStyle(fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Phone: " + Studentphone.toString(),
                          style:
                              TextStyle(fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Email: " + Studentemail.toString(),
                          style:
                              TextStyle(fontSize: fsize, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Academics",
                          style: TextStyle(
                              fontSize: 25 + fsize / 3, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "GPA",
                          style:
                          TextStyle(fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Projected ",
                          style:
                          TextStyle(fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Current forecast",
                          style:
                          TextStyle(fontSize: fsize, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
