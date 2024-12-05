import 'package:flutter/material.dart';

 class MyDecaretedbox extends StatelessWidget {
   MyDecaretedbox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xff353535).withOpacity(0.7),
        borderRadius: BorderRadius.circular(25),
      ),

      child: child ,
    );
  }
}
