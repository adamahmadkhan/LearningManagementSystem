import 'package:flutter/material.dart';
import 'package:newloginpage/MyDrawer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'constraintsvalues.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        backgroundColor: Color(0xff002b5c),
      ),
      drawer: CustomDrawer(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Card(
              //     child: ToggleSwitch(
              //       customWidths: [100.0, 100.0,130],
              //     initialLabelIndex: 0,
              //     totalSwitches: 3,
              //     labels: ['Dark Theme', 'Light Theme', 'System Default',],
              //     // onToggle: (index) {
              //     //   print('switched to: $index');
              //     // },
              //     ),
              //   ),
              // ),
             Text("Font Size",style: TextStyle(fontSize: fsize),),
              Slider(
                    min: 15.0,
                    max: 30.0,
                    value: fsize,
                    onChanged: (value) {
                      setState(() {
                        fsize=value;
                      });
                    },
              ),
              Text("Notifications",style: TextStyle(fontSize: fsize),),
              SizedBox(
                height: 20,
              ),
              // ToggleSwitch(
              //   minWidth: 50.0,
              //   cornerRadius: 20.0,
              //   activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
              //   activeFgColor: Colors.white,
              //   inactiveBgColor: Colors.grey,
              //   inactiveFgColor: Colors.white,
              //   initialLabelIndex: 0,
              //   totalSwitches: 2,
              //   labels: ['On', 'Off'],
              //   radiusStyle: true,
              //   onToggle: (index) {
              //     print('switched to: $index');
              //   },
              // ),
            ],
          ),
        ),
    );
  }
}
