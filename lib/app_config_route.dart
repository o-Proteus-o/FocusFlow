// import 'package:flutter/material.dart';
// import 'package:focusflow/Features/Home/presentation/views/home_view/home_view.dart';
// import 'package:focusflow/Features/Home/presentation/views/task/task_view.dart';
// import 'package:focusflow/Features/Home/presentation/views/timer/timer_view.dart';
// import 'package:go_router/go_router.dart';

// class AppConfigRoute {
//   final GoRouter _goRouter = GoRouter(
//     initialLocation: '/home',
//     routes: [
//       GoRoute(
//         name: 'home',
//         path: '/home',
//         pageBuilder: (context, state) {
//           return MaterialPage(child: HomeView());
//         },
//       ),
//       GoRoute(
//         name: 'tasks',
//         path: '/tasks',
//         pageBuilder: (context, state) {
//           return MaterialPage(child: TaskView());
//         },
//       ),
//       GoRoute(
//         name: 'timer',
//         path: '/timer',
//         pageBuilder: (context, state) {
//           return MaterialPage(child: TimerView());
//         },
//       ),
//       GoRoute(path: '/', redirect: (context, state) => '/home'),
//     ],
//     errorBuilder: (context, state) {
//       return const Scaffold(body: Center(child: Text('404')));
//     },
//   );
//   get goRouter => _goRouter;
// }
