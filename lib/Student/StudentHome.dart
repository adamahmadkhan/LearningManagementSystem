import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newloginpage/Graphqldata.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:newloginpage/Mybutton.dart';
// import 'package:newloginpage/Setting.dart';
import 'package:newloginpage/Student/StudentAttendance.dart';
import 'package:newloginpage/Student/StudentFee.dart';
import 'package:newloginpage/Student/studentsNotifications.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newloginpage/constraintsvalues.dart';

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

  List<notifications> StdNtfs = [];

  Future<List<notifications>> getPostApi() async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/8888b6d8-5923-422b-b803-c5c528933125'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        StdNtfs.add(notifications.fromJson(i));
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
        title: const Text("Home"),
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
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(child:
                Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
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
                        backgroundImage: NetworkImage(Profile),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        UserName.toString().toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white, fontSize: fsize),
                      ),
                      Text(
                        UserRoll.toString().toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.white, fontSize: fsize),
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
                                  }, icons:Icon(Icons.book,size: 40,)),

                                  MyButton(title: 'View\nMarks', onPress: (){
                                    print("Marks");

                                  }, icons: const Icon(Icons.add_card_outlined,size: 40,)),

                                  MyButton(title: 'Check\nFees',
                                      onPress: (){

                                  }, icons: const Icon(Icons.payments_rounded,size: 40,)),
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
              "Student Details",
              style: TextStyle(fontSize: 30),
            ),
            //API calls

            // FutureBuilder(
            //   future: getPostApi(),
            //   builder: (context, snapshot) {
            //     return CarouselSlider.builder(
            //       itemCount: 15,
            //       itemBuilder: (context, int itemIndex, int pageViewIndex) =>
            //           Container(
            //             height: 50,
            //             width: 250,
            //             decoration: BoxDecoration(
            //               color: Colors.cyan,
            //             ),
            //             child: Text(itemIndex.toString()),
            //           ),
            //       options: CarouselOptions(
            //         height: 250.0,
            //         enlargeCenterPage: true,
            //         autoPlay: true,
            //         aspectRatio: 16 / 9,
            //         autoPlayCurve: Curves.fastOutSlowIn,
            //         enableInfiniteScroll: true,
            //         autoPlayAnimationDuration: Duration(milliseconds: 400),
            //         viewportFraction: 0.8,
            //       ),
            //     );
            //   }),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                items: [
                  //1st Image of Slider
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
                                  Icon(Icons.assignment,color: Colors.black,size: fsize-3,),
                                  const Text("\t\tAssignment Summery",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
                                ],
                              ),
                             const SizedBox(height: 15,),
                            const Text("Active:\t3"),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(height: 5,),
                              const Text("Pending:\t1"),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(height: 5,),
                             const Text("Ending:\t8"),
                              const Divider(
                                thickness: 2,
                              ),
                              Text("Submitted:\t 3"),
                            ],)
                      ),
                    ),
                  ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Material(
                        elevation: 40,
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                        //color: Colors.tealAccent,
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Row(
                              children: [
                                Icon(Icons.person,color: Colors.black,size: fsize,),
                                Text("\t\tInfo",style: TextStyle(fontSize: fsize,color: Colors.black,fontWeight: FontWeight.w400),),
                              ],
                            ),
                             SizedBox(height: 20,),
                             Text("Name:\t"+UserName),
                             const Divider(
                               thickness: 2,
                             ),
                             SizedBox(height: 10,),
                             Text("Roll Number:\t"+UserRoll),
                             const Divider(
                               thickness: 2,
                             ),
                             SizedBox(height: 10,),
                             Text("CNIC:\t"),
                             const Divider(
                               thickness: 2,
                             ),
                          ],)
                        ),
                      ),
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
                  // Container(
                  //   margin: const EdgeInsets.all(6.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     image: const DecorationImage(
                  //       image: AssetImage("assets/notifications.jpeg"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),

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
            ),
            SizedBox(
              height: 10,
            ),
            const Divider(
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
                                   Text(
                                    "Title",
                                    style: TextStyle(
                                        fontSize: fsize+5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(StdNtfs[index].title.toString(),style: TextStyle(fontSize: fsize),),
                                  Text(
                                    "Message",
                                    style: TextStyle(
                                        fontSize: fsize+5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(StdNtfs[index].body.toString(),style: TextStyle(fontSize: fsize),),
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
    UserName = Studentname.toString();
    UserRoll = Studentrollnumber.toString();
    Profile = Studentprofile.toString();
  }
}
