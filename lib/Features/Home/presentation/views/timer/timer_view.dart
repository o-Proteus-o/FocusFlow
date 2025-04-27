import 'package:flutter/material.dart';
import 'package:focusflow/constant.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});
  static const String routeName = '/timer';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            "Track Your \nFocus Time",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return TimerSetter();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TimerSetter extends StatelessWidget {
  const TimerSetter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "5",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Min",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
