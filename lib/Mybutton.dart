import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.icons})
      : super(key: key);

  final String title;
  final VoidCallback onPress;
  final Icon icons;

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: [
                icons,
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
