import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:newloginpage/Student/StudentHome.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mod = "";
  String username = "";
  String password = "";
  String loginornot = "";
  final List<String> genderItems = ['Admin', 'Teacher', 'Student'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/1762851/pexels-photo-1762851.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
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
                                height: 550, //height of TabBarView
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
                                              username = value.toString();
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
                                              password = value.toString();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: DropdownButtonFormField2(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
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
                                            isExpanded: true,
                                            hint: const Text(
                                              'Your Are?',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45,
                                            ),
                                            iconSize: 30,
                                            buttonHeight: 60,
                                            buttonPadding:
                                                const EdgeInsets.only(
                                                    left: 20, right: 10),
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            items: genderItems
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select modelue';
                                              }
                                            },
                                            onChanged: (value) {
                                              mod = value.toString();
                                              setState(() {});
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
                                        Text(loginornot),
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
                                              username = value.toString();
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
                                                    loginuser();
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
                                              username = value.toString();
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
                                              password = value.toString();
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
                                              password = value.toString();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: DropdownButtonFormField2(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
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
                                            isExpanded: true,
                                            hint: const Text(
                                              'Your Are?',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45,
                                            ),
                                            iconSize: 30,
                                            buttonHeight: 60,
                                            buttonPadding:
                                                const EdgeInsets.only(
                                                    left: 20, right: 10),
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            items: genderItems
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select modelue';
                                              }
                                            },
                                            onChanged: (value) {
                                              mod = value.toString();
                                              setState(() {});
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
                                                    loginuser();
                                                    setState(() {});
                                                  },
                                                )),
                                          ],
                                        ),
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
    if (username == "std" && password == "pwd" && mod == "Student" ||
        username == "tea" && password == "pwd" && mod == "Teacher" ||
        username == "adm" && password == "pwd" && mod == "Admin") {
      Navigator.push(
        context,

        MaterialPageRoute(
            builder: (context) => StudentHome()),
      );
    } else {
      loginornot = "invalid password";
    }
  }
}
