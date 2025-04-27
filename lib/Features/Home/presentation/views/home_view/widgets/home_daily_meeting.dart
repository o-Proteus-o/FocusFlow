import 'package:flutter/material.dart';

class HomeDailyMeeting extends StatelessWidget {
  const HomeDailyMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0XFFD5CDFF),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "YOU HAVE 2 \nMORE EVENTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_outward)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Text(
                  "Daily Meeting",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("now"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("10:00 am - 12:30 am"),
          ],
        ),
      ),
    );
  }
}
