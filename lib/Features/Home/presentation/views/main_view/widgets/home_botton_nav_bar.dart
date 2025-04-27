import 'package:flutter/material.dart';
import 'package:focusflow/constant.dart';

class HomeBottonNavBar extends StatelessWidget {
  const HomeBottonNavBar({
    super.key,
    required this.icon,
    this.onTap,
    required this.color,
    required this.text,
    required this.selectedIndex,
  });
  final Icon icon;
  final void Function()? onTap;
  final Color color;
  final Text? text;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: .5, horizontal: 1),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                icon,
                if (text != null)
                  AnimatedOpacity(
                    opacity: text != null ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: text,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
