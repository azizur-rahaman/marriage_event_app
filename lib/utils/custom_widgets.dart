import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marriage_event/utils/app_colors.dart';

class CustomWidgets {
  //title text widget
  static Widget TitleText(String text, Color color, {double fontSize = 20}) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: color));
  }

//match a muslim text
  static Widget matchAMuslimText() {
    return const Text('MATCH A MUSLIM',
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white));
  }

  //textformfield builder

  static Widget textFormFiled(
      String title, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Email',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: Icon(icon),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: AppColors.mainColor, width: 2))),
        ),
      ],
    );
  }
}
