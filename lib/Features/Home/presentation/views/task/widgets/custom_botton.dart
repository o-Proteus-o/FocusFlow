import 'package:flutter/material.dart';

class CustomBottonSheet extends StatelessWidget {
  const CustomBottonSheet({
    super.key,
    this.onTap,
    required this.child,
    required this.color,
  });
  final void Function()? onTap;
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, bottom: 24, right: 7),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black, width: 1.5),
            // boxShadow: [
            //   BoxShadow(color: Colors.black, blurRadius: 2, spreadRadius: .3),
            // ],
          ),
          child: child,
        ),
      ),
    );
  }
}
