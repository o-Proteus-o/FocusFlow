import 'package:flutter/material.dart';
import 'package:focusflow/Features/Home/presentation/views/home_view/home_view.dart';
import 'package:focusflow/Features/Home/presentation/views/task/task_view.dart';
import 'package:focusflow/Features/Home/presentation/views/timer/timer_view.dart';
import 'package:focusflow/Features/Home/presentation/views/main_view/widgets/home_botton_nav_bar.dart';
import 'package:focusflow/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    this.icon,
    this.color,
    this.text,
    this.selectedIndex,
  });
  final Icon? icon;
  final Color? color;
  final Text? text;
  final int? selectedIndex;
  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  bool isTapped = false;
  int selectedIndex = 0;
  List<Color> colors = [AppColors.blackColor, Colors.white];
  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.listCheck,
    Icons.timer,
    FontAwesomeIcons.bots,
  ];
  List<String> texts = ["Home", "Tasks", "Timer", "FocusBot"];
  void _onTap(int index) {
    if (index >= 0 && index < pages.length) {
      // Check if index is valid
      setState(() {
        selectedIndex = index;
      });
    } else {
      // Handle the error (e.g., log it, show a message, etc.)
    }
  }

  final List<Widget> pages = [HomeView(), TaskView(), TimerView()];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bottomNavBarWidth = screenWidth * 0.509; // 60% of screen width
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: SizedBox(
        width: screenWidth * 0.9,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            bottom: 40,
            right: bottomNavBarWidth,
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width *
                  0.9, // Responsive max width
            ),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeBottonNavBar(
                  selectedIndex: selectedIndex,
                  onTap: () => _onTap(0),
                  color:
                      selectedIndex == 0 ? Colors.white : AppColors.blackColor,
                  icon: Icon(
                    icons[0],
                    color:
                        selectedIndex == 0
                            ? AppColors.blackColor
                            : Colors.white,
                  ),
                  text:
                      selectedIndex == 0
                          ? Text(
                            texts[0],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  selectedIndex == 0
                                      ? AppColors.blackColor
                                      : Colors.white,
                            ),
                          )
                          : null,
                ),
                HomeBottonNavBar(
                  selectedIndex: selectedIndex,
                  onTap: () => _onTap(1),
                  color:
                      selectedIndex == 1 ? Colors.white : AppColors.blackColor,
                  icon: Icon(
                    icons[1],
                    color:
                        selectedIndex == 1
                            ? AppColors.blackColor
                            : Colors.white,
                  ),
                  text:
                      selectedIndex == 1
                          ? Text(
                            texts[1],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  selectedIndex == 1
                                      ? AppColors.blackColor
                                      : Colors.white,
                            ),
                          )
                          : null,
                ),
                HomeBottonNavBar(
                  selectedIndex: selectedIndex,
                  onTap: () => _onTap(2),
                  color:
                      selectedIndex == 2 ? Colors.white : AppColors.blackColor,
                  icon: Icon(
                    icons[2],
                    color:
                        selectedIndex == 2
                            ? AppColors.blackColor
                            : Colors.white,
                  ),
                  text:
                      selectedIndex == 2
                          ? Text(
                            texts[2],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  selectedIndex == 2
                                      ? AppColors.blackColor
                                      : Colors.white,
                            ),
                          )
                          : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
