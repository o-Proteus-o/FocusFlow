import 'package:flutter/material.dart';
import 'package:focusflow/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              CircleAvatar(backgroundColor: Colors.blueGrey, radius: 30),
            ],
          ),
          SizedBox(height: 15),
          Text(
            "Here are your plan \nfor today",
            style: TextStyle(color: Colors.black.withOpacity(.5), fontSize: 18),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              CustomRow(
                icon: Icon(
                  FontAwesomeIcons.personWalking,
                  color: AppColors.pinkColor,
                ),
                text: Text("5.2k"),
              ),
              SizedBox(width: 15),
              CustomRow(
                icon: Icon(FontAwesomeIcons.moon, color: AppColors.pinkColor),
                text: Text("data"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.icon, required this.text});
  final Icon icon;
  final Text text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [icon, text]);
  }
}
