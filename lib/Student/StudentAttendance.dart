import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
class StdAttendence extends StatefulWidget {
  const StdAttendence({Key? key}) : super(key: key);

  @override
  State<StdAttendence> createState() => _StdAttendenceState();
}

class _StdAttendenceState extends State<StdAttendence> {
  @override
  String option = "";
  double absent = 0;
  double present = 0;
  bool datachoosen=false;
  final List<String> Subjects = [
    'Microprocesoor',
    'Mobile Application',
    'HCI',
    "Machine Learning"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        backgroundColor: Color(0xff002b5c),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 40,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: 260,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/stdAttendence.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          //contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.tealAccent, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.redAccent, width: 2),
                            borderRadius: BorderRadius.circular(16),
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
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: Subjects.map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            )).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select module';
                          }
                        },
                        onChanged: (value) {
                          option = value.toString();
                          piechartupdate(option);
                          setState(() {});
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    if(datachoosen)
                    PieChart(
                      dataMap: {
                        "Parent": present,
                        "Absent": absent,
                      },
                      animationDuration: Duration(milliseconds: 800),
                      colorList: const [Colors.blueAccent, Colors.redAccent],
                    )
                    else
                      Text("Choose a subject")

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void piechartupdate (String value) {
    datachoosen=true;
    if (value == "Microprocesoor") {
      present = 10;
      absent = 12;
    } else if (value == 'Mobile Application') {
      present = 20;
      absent = 5;
    } else if (value == 'HCI') {
      present = 18;
      absent = 10;
    } else if (value == "Machine Learning") {
      present = 20;
      absent = 3;
    }
  }
}
