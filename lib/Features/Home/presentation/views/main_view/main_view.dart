import 'package:flutter/material.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/task_floting_bar.dart';
import 'package:focusflow/Features/Home/presentation/views/main_view/widgets/home_page_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingBar(isClicked: isClicked),
      body: const MainBody(),
    );
  }
}
