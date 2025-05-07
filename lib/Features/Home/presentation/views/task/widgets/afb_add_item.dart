import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/data/model/task_model.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_cubit.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/custom_botton.dart';
import 'package:get/get.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  bool isTapped = true;
  TextEditingController textController = TextEditingController();
  TaskmodelDb taskmodelDb = TaskmodelDb();

  void saveTask() {
    final taskName = textController.text;
    if (taskName.isNotEmpty) {
      context.read<TaskCubit>().addTask(taskName);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomBottonSheet(
                  onTap: () {
                    Get.back();
                  },
                  color: Colors.white,
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomBottonSheet(
                  onTap: saveTask,
                  color: Colors.black,
                  child:
                      isTapped
                          ? Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          : CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
