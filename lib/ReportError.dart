import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:newloginpage/constraintsvalues.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String Message = '';
  String Fetch= '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  void getdata() async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    Fetch=obj.getString('a').toString();
    print("fetch data is"+Fetch+toString()+"\n");
    setState(() {});
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
        backgroundColor: const Color(0xff002b5c),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                      image: AssetImage('assets/error.png'), fit: BoxFit.cover),
                ),
              ),
            ),
            Material(
              elevation: 40,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text("Please type your enquiry", style: TextStyle(fontSize: fsize)),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        minLines: 5,
                        maxLines: 8,
                        style: TextStyle(fontSize: fsize),
                        decoration: InputDecoration(
                          labelText: "Message",
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
                        onChanged: (value) {
                          Message = value.toString();
                         // print(Message);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 25),
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.cyanAccent,
                              shape: BoxShape.circle,
                            ),
                            child: TextButton(
                              child: const Icon(Icons.arrow_forward_ios),
                              onPressed: ()  async {
                                print(Message.toString());
                                SharedPreferences obj = await SharedPreferences.getInstance();
                                obj.setString('a', Message);
                                Fetch=Message;
                                setState(() {});
                              },
                            )),
                      ],
                    ),

                    Text("Your enquiry \n"+Fetch.toString()+"\n is underprocess"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
