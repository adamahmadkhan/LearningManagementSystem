import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
class StdAttendence extends StatefulWidget {
  const StdAttendence({Key? key}) : super(key: key);

  @override
  State<StdAttendence> createState() => _StdAttendenceState();
}

class _StdAttendenceState extends State<StdAttendence> {
  @override
  final List<String> Subjects = ['Microprocesoor', 'Mobile Application', 'HCI',"Machine Learning"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        backgroundColor: Color(0xff002b5c),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Material(
            elevation: 40,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Container(
            height: 260,
            width: double.infinity,
            decoration: const BoxDecoration(

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              image: DecorationImage(
                image: AssetImage('assets/stdAttendence.png'),
                fit: BoxFit.cover
              ),

            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
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
                        'Select A course',
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
                      items: Subjects
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
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
            Material(
              elevation: 40,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              child: Container(
                height: 800,
                width: double.infinity,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
