import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double fontsize=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  child: ToggleSwitch(
                    customWidths: [100.0, 100.0,130],
                  initialLabelIndex: 0,
                  totalSwitches: 3,
                  labels: ['Dark Theme', 'Light Theme', 'System Default',],
                  // onToggle: (index) {
                  //   print('switched to: $index');
                  // },
                  ),
                ),
              ),
             Text("Font Size",style: TextStyle(fontSize: 10+fontsize/3),),
              Slider(
                    min: 0.0,
                    max: 100.0,
                    value: fontsize,
                    onChanged: (value) {
                      setState(() {
                        fontsize=value;
                      });
                    },
              ),
              Text("Notifications",style: TextStyle(fontSize: 10+fontsize/3),),
              ToggleSwitch(
                minWidth: 50.0,
                cornerRadius: 20.0,
                activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['On', 'Off'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ],
          ),
        ),
    );
  }
}
