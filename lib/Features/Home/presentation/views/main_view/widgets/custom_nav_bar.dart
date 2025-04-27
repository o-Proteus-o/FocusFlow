import 'package:flutter/material.dart';
import 'package:focusflow/Features/Home/presentation/views/main_view/widgets/home_botton_nav_bar.dart';
import 'package:focusflow/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    this.selectedIndex,
    this.onTap,
    this.isTapped,
  });
  final int? selectedIndex;
  final void Function()? onTap;
  final bool? isTapped;
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  bool isTapped = false;
  int selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
      isTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20, bottom: 40, right: 217),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              HomeBottonNavBar(
                selectedIndex: selectedIndex,
                onTap: () => _onTap(0),

                color:
                    selectedIndex == 0
                        ? (isTapped ? Colors.white : AppColors.blackColor)
                        : Colors.black,
                icon: Icon(
                  FontAwesomeIcons.house,
                  color:
                      selectedIndex == 0
                          ? (isTapped ? AppColors.blackColor : Colors.white)
                          : Colors.white,
                ),
                text:
                    selectedIndex == 0
                        ? isTapped
                            ? Text(
                              "Home",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isTapped
                                        ? AppColors.blackColor
                                        : Colors.white,
                              ),
                            )
                            : null
                        : null,
              ),
              HomeBottonNavBar(
                selectedIndex: selectedIndex,
                onTap: () => _onTap(1),
                color:
                    selectedIndex == 1
                        ? (isTapped ? Colors.white : AppColors.blackColor)
                        : AppColors.blackColor,
                icon: Icon(
                  FontAwesomeIcons.listCheck,
                  color:
                      selectedIndex == 1
                          ? (isTapped ? AppColors.blackColor : Colors.white)
                          : Colors.white,
                ),
                text:
                    selectedIndex == 1
                        ? isTapped
                            ? Text(
                              "Tasks",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isTapped
                                        ? AppColors.blackColor
                                        : Colors.white,
                              ),
                            )
                            : null
                        : null,
              ),
              HomeBottonNavBar(
                selectedIndex: selectedIndex,
                onTap: () => _onTap(2),
                color:
                    selectedIndex == 2
                        ? (isTapped ? Colors.white : AppColors.blackColor)
                        : AppColors.blackColor,
                icon: Icon(
                  Icons.timer,
                  color:
                      selectedIndex == 2
                          ? (isTapped ? AppColors.blackColor : Colors.white)
                          : Colors.white,
                ),
                text:
                    selectedIndex == 2
                        ? isTapped
                            ? Text(
                              "Timer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isTapped
                                        ? AppColors.blackColor
                                        : Colors.white,
                              ),
                            )
                            : null
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
