import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainer1 extends StatelessWidget {
  const MyContainer1({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 20),
        child: Container(
          height: 48,
          width: 381,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(252, 171, 16, 1),
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              top: BorderSide(
                width: 1.0,
                color: Color.fromRGBO(239, 239, 239, 1),
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    height: 19.6 / 16,
                  ),
                ),
                const SizedBox(width: 10),
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: Icon(Icons.arrow_forward_outlined,
                      color: Color.fromRGBO(239, 239, 239, 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyContainer2 extends StatelessWidget {
  const MyContainer2({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 20),
        child: Container(
          height: 48,
          width: 381,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(252, 171, 16, 1),
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              top: BorderSide(
                width: 1.0,
                color: Color.fromRGBO(239, 239, 239, 1),
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    height: 19.6 / 16,
                  ),
                ),
                const SizedBox(width: 10),
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: Icon(Icons.camera_alt_outlined,
                      color: Color.fromRGBO(239, 239, 239, 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
