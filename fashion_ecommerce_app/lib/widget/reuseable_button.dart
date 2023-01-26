
import 'package:flutter/material.dart';
 

class ReuseableButton extends StatelessWidget {
  const ReuseableButton({
    Key? key,
    required this.text, required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Center(
      child: MaterialButton(
        onPressed: onTap,
        minWidth: size.width * 0.9,
        height: size.height * 0.07,
        color: const Color(0xff141414),
        child: Text(
         text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}