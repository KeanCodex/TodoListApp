import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustTextfield extends StatelessWidget {
  CustTextfield({
    super.key,
    required this.controller,
    required this.label,
    this.color,
  });

  String? label;
  Color? color;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    //customized border
    const custborder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.blueGrey, width: 1));

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[600]),
        border: custborder,
        enabledBorder: custborder,
        focusedBorder: custborder,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter item...';
        }
        return null;
      },
    );
  }
}
