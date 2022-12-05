import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:newloginpage/Mybutton.dart';
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
                //  Container(
                //   height: 250,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.teal,
                //     borderRadius: BorderRadius.only(
                //       bottomLeft: Radius.circular(60),
                //       bottomRight: Radius.circular(60),
                //     ),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       CircleAvatar(
                //         radius: 60,
                //         backgroundImage: NetworkImage(Profile.toString()),
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Text(
                //         UserName.toString(),
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, color: Colors.white),
                //       ),
                //       Text(
                //         UserRoll.toString(),
                //         style: TextStyle(
                //             fontWeight: FontWeight.w300, color: Colors.white),
                //       )
                //     ],
                //   ),
                // ),
            //   Container(
            //     height: 150,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.grey,
            //       borderRadius: BorderRadius.all(Radius.circular(20)),
            //     ),
            //   ),
            // Divider(
            //   height: 10,
            //   thickness: 2,
            // ),
            Stack(
              children: [
                Container(
                  height: 440,
                  width: double.infinity,
                ),
                Positioned(child:
                Container(
                  height: 260,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
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
                      Text(
                        UserName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        UserRoll.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.white),
                      )
                    ],
                  ),
                ),),
                Positioned(
                    top: 230,
                    right: 10,
                    left: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Material(
                        elevation: 40,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Row(

                                children: [
                                  MyButton(title: 'attendance', onPress: (){
                                    print("Attendance");
                                  }, icons: Icon(Icons.book)),

                                  MyButton(title: 'Marks', onPress: (){
                                    print("Marks");

                                  }, icons: Icon(Icons.add_card_outlined)),

                                  MyButton(title: 'Assignments', onPress: (){
                                    print("Assigmnets");

                                  }, icons: Icon(Icons.assessment)),

                                  MyButton(title: 'fees', onPress: (){
                                    print("fee");
                                  }, icons: Icon(Icons.payments_rounded)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Divider(
              height: 10,
              thickness: 2,
            ),
            Text(
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
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/301926/pexels-photo-301926.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/301920/pexels-photo-301920.jpeg?auto=compress&cs=tinysrgb&w=800"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/256417/pexels-photo-256417.jpeg?auto=compress&cs=tinysrgb&w=800"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
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
                autoPlayAnimationDuration: Duration(milliseconds: 400),
                viewportFraction: 0.8,
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
            ),
            Text(
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
                      physics: NeverScrollableScrollPhysics(),
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(StdNtfs[index].title.toString()),
                                  Text(
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
