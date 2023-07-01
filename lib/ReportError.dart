import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:newloginpage/constraintsvalues.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  String Message="";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
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
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/error.png'),
                      fit: BoxFit.cover),
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

                    Text("Fee details"),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        minLines: 5,
                        maxLines: 8,
                        style: TextStyle(fontSize: fsize),
                        decoration: InputDecoration(
                          labelText: "Message",
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
                          Message=value.toString();
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
                               print(Message.toString());
                                setState(() {});
                              },
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),          ],
        ),
      ),

    );
  }
}
