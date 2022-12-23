import 'package:e_school/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class CustomTextFromField extends StatelessWidget {
  final title;
  final hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFromField(
      {super.key,
      required this.title,
      required this.hintText,
      this.obscureText = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                kBlackTextStyleRoboto.copyWith(fontSize: 16, fontWeight: bold),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            cursorColor: kTextBlack,
            decoration: InputDecoration(
                hintText: hintText,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kTextBlack))),
          )
        ],
      ),
    );
  }
}
