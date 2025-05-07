import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_cubit.dart';
import 'package:focusflow/Features/Home/presentation/views/main_view/main_view.dart';
// import 'package:focusflow/app_config_route.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:focusflow/app_config_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("taskBox");
  await Hive.openBox("eventBox");

  runApp(
    BlocProvider(create: (context) => TaskCubit(), child: const FocusFlow()),
  );
}

class FocusFlow extends StatelessWidget {
  const FocusFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}
