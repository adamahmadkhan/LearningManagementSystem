import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:newloginpage/Student/StudentHome.dart';
import 'package:newloginpage/constraintsvalues.dart';
import 'Student/studentdata.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mod = "";
  String EnterRoll = "";
  String EnterPassword = "";
  String loginornot = "";
  List<Studentdata> Stdata = [];
  Future<List<Studentdata>> getstudentdata() async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/fa35b411-c574-4cb1-9ef5-f8d9f37b4dfa'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Stdata.add(Studentdata.fromJson(i));
      }
      return Stdata;
    } else {
      return Stdata;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstudentdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
         physics: NeverScrollableScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/loginpage.webp'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child:  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/loadinglogo.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: DefaultTabController(
                      length: 3, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          children: [
                            const TabBar(
                              labelColor: Colors.green,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Login'),
                                Tab(text: 'Forgot'),
                                Tab(text: 'Signup'),
                              ],
                            ),
                            Container(
                               height: MediaQuery.of(context).size.height,//height of TabBarView
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: [
                                  // i will add expanded widget here with noscroll physics
                                  Container(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Welcome back $mod !!",
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              //border: OutlineInputBorder(),
                                              labelText: "Roll Number",
                                              hintText: "fa00-abc-000",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.7)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.tealAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              EnterRoll = value.toString();
                                              EnterRoll=EnterRoll.toLowerCase().toString();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: true,
                                            enableSuggestions: false,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              //border: OutlineInputBorder(),
                                              labelText: "Password",
                                              hintText: "Enter Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.7)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.tealAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              EnterPassword = value.toString();
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 25),
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: Colors.cyanAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: TextButton(
                                                  child: const Icon(
                                                      Icons.arrow_forward_ios),
                                                  onPressed: () {
                                                    loginuser();
                                                    setState(() {});
                                                  },
                                                )),
                                          ],
                                        ),
                                        Text(loginornot,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red, fontSize: 20),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Enter your Email!!",
                                          style:  TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              //border: OutlineInputBorder(),
                                              labelText: "Email",
                                              hintText: "example@example.com",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.7)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.tealAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              EnterRoll = value.toString();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 25),
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: Colors.cyanAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: TextButton(
                                                  child: const Icon(
                                                      Icons.arrow_forward_ios),
                                                  onPressed: () {
                                                    print("Reset request Sucessfully send "+EnterRoll);
                                                    setState(() {});
                                                  },
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              //border: OutlineInputBorder(),
                                              labelText: "Email",
                                              hintText: "example@example.com",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.7)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.tealAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              EnterRoll = value.toString();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: true,
                                            enableSuggestions: false,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              //border: OutlineInputBorder(),
                                              labelText: "Password",
                                              hintText: "Enter Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.7)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.tealAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              EnterPassword = value.toString();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: true,
                                            enableSuggestions: false,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              //border: OutlineInputBorder(),
                                              labelText: "Re Enter",
                                              hintText: "Enter Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.7)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.tealAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              EnterPassword = value.toString();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 25),
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: Colors.cyanAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: TextButton(
                                                  child: const Icon(
                                                      Icons.arrow_forward_ios),
                                                  onPressed: () {
                                                    print("Sign Up request successfully send");
                                                    setState(() {});
                                                  },
                                                )),
                                          ],
                                        ),
                                        // FutureBuilder(
                                        //   future: getstudentdata(),
                                        //   builder: (context, snapshot) {
                                        //     if (!snapshot.hasData) {
                                        //       return const Text("LOADING DATA");
                                        //     } else {
                                        //       return ListView.builder(
                                        //           physics: const NeverScrollableScrollPhysics(),
                                        //           shrinkWrap: true,
                                        //           itemCount: Stdata.length,
                                        //           itemBuilder: (context, index) {
                                        //             return Padding(
                                        //               padding: const EdgeInsets.all(8.0),
                                        //               child: Material(
                                        //                 elevation: 40,
                                        //                 borderRadius: BorderRadius.circular(12),
                                        //                 child: Padding(
                                        //                   padding: const EdgeInsets.all(8.0),
                                        //                   child: Column(
                                        //                     mainAxisAlignment: MainAxisAlignment.start,
                                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                                        //                     children: [
                                        //                       Text(
                                        //                         "Title",
                                        //                         style: TextStyle(
                                        //
                                        //                             fontWeight: FontWeight.bold),
                                        //                       ),
                                        //                       Text(Stdata[index].rollnumber.toString(),),
                                        //                       Text(
                                        //                         "Message",
                                        //                         style: TextStyle(
                                        //                             fontWeight: FontWeight.bold),
                                        //                       ),
                                        //                       Text(Stdata[index].email.toString(),),
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             );
                                        //           });
                                        //     }
                                        //   },
                                        // )
                                      ],
                                    ),
                                  ),
                                ]))
                          ])),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginuser() {
    for(int i=0;i<Stdata.length;i++)
      {
        print(Stdata[i].rollnumber.toString()+"  "+Stdata[i].password.toString());
        if(Stdata[i].rollnumber==EnterRoll && Stdata[i].password==EnterPassword){
        Studentname=Stdata[i].name.toString();
        Studentrollnumber=Stdata[i].rollnumber.toString();
        Studentprofile=Stdata[i].profile.toString();
        Studentemail=Stdata[i].email.toString();
        Studentphone=Stdata[i].phone.toString();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentHome()),
      );
    }}
      loginornot = "Invalid UserName or password";

  }
}
