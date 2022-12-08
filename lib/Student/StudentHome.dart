import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:newloginpage/Mybutton.dart';
// import 'package:newloginpage/Setting.dart';
import 'package:newloginpage/Student/StudentAttendance.dart';
import 'package:newloginpage/Student/studentsNotifications.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  String UserName = "";
  String UserRoll = "";
  String Profile = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetNames();
  }

  List<studentsNotifications> StdNtfs = [];

  Future<List<studentsNotifications>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        StdNtfs.add(studentsNotifications.fromJson(i));
      }
      return StdNtfs;
    } else {
      return StdNtfs;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        backgroundColor: const Color(0xff002b5c),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                ),
                Positioned(child:
                Container(
                  height: 260,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff002b5c),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        UserName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        UserRoll.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.white),
                      )
                    ],
                  ),
                ),),
                Positioned(
                    top: 230,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 40,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  MyButton(title: 'View\nAttendance',onPress: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const StdAttendence()),
                                    );
                                  }, icons: const Icon(Icons.book)),

                                  MyButton(title: 'View\nMarks', onPress: (){
                                    print("Marks");

                                  }, icons: const Icon(Icons.add_card_outlined)),

                                  MyButton(title: 'View\nAssignments', onPress: (){
                                    print("Assigmnets");

                                  }, icons: const Icon(Icons.assessment)),

                                  MyButton(title: 'Check\nFees', onPress: (){
                                    print("fee");
                                  }, icons: const Icon(Icons.payments_rounded)),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(

                                children: [
                                  MyButton(title: 'Attendance', onPress: (){
                                    print("Attendance");
                                  }, icons: const Icon(Icons.book)),

                                  MyButton(title: 'Marks', onPress: (){
                                    print("Marks");

                                  }, icons: const Icon(Icons.add_card_outlined)),

                                  MyButton(title: 'Assignments', onPress: (){
                                    print("Assigmnets");

                                  }, icons: const Icon(Icons.assessment)),

                                  MyButton(title: 'Fees', onPress: (){
                                    print("fee");
                                  }, icons: const Icon(Icons.payments_rounded)),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            const Text(
              "Events",
              style: TextStyle(fontSize: 30),
            ),
            // For api images
            // CarouselSlider.builder(
            //   itemCount: 15,
            //   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            //       Container(
            //         height: 50,
            //         width: 250,
            //         decoration: BoxDecoration(
            //           color: Colors.cyan,
            //         ),
            //         child: Text(itemIndex.toString()),
            //       ),
            //   options: CarouselOptions(
            //     height: 250.0,
            //     enlargeCenterPage: true,
            //     autoPlay: true,
            //     aspectRatio: 16 / 9,
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     enableInfiniteScroll: true,
            //     autoPlayAnimationDuration: Duration(milliseconds: 400),
            //     viewportFraction: 0.8,
            //   ),
            // ),
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/301926/pexels-photo-301926.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/301920/pexels-photo-301920.jpeg?auto=compress&cs=tinysrgb&w=800"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/256417/pexels-photo-256417.jpeg?auto=compress&cs=tinysrgb&w=800"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/355948/pexels-photo-355948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                viewportFraction: 0.8,
              ),
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            const Text(
              "Notification",
              style: TextStyle(fontSize: 30),
            ),
            FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("LOADING DATA");
                } else {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: StdNtfs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 40,
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(StdNtfs[index].title.toString()),
                                  const Text(
                                    "Message",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(StdNtfs[index].body.toString()),
                                ],
                              ),
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

  void SetNames() {
    UserName = "Adam Ahmad Khan";
    UserRoll = "Fa19-Bcs-108";
    Profile =
        "https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  }
}
