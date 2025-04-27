import 'package:flutter/material.dart';
import 'package:focusflow/Features/Home/presentation/views/home_view/widgets/home_daily_meeting.dart';
import 'package:focusflow/Features/Home/presentation/views/home_view/widgets/home_view_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeViewAppBar()),
        SliverToBoxAdapter(child: HomeDailyMeeting()),
        // SliverGrid.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //   itemBuilder: (context, index) {
        //     return Container(
        //       decoration: BoxDecoration(),
        //       child: Column(
        //         children: [
        //           Row(
        //             children: [

        //             ],
        //           ),

        //         ],
        //       ),
        //     );
        //   },)
      ],
    );
  }
}
