import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  String mod="";
  final List<String> genderItems = [
    'Admin',
    'Teacher',
    'Student'

  ];
  Widget build(BuildContext context) {
    return Scaffold(
      //hey ??
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/pro.jpg'),
              ),
              Text(
                "Welcome back "+mod,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "example@example.com",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.tealAccent,width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent,width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent,width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.redAccent,width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent,width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.redAccent,width: 2),
                      borderRadius: BorderRadius.circular(16),
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
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                    setState(() {
                    });
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}