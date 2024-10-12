import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustText extends StatelessWidget {
  CustText(
      {super.key,
      required this.label,
      this.fontsize,
      this.fontweight,
      this.fontcolor,
      this.fontspace});

  String? label;
  double? fontsize;
  double? fontspace;
  Color? fontcolor;
  FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label ?? "",
      style: GoogleFonts.inter(
        fontSize: fontsize,
        fontWeight: fontweight,
        letterSpacing: fontspace,
        color: fontcolor,
      ),
    );
  }
}
