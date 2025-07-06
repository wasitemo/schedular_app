import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedular_app_flutter/feature/task/domain/entities/task_entity.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final GlobalKey keyForm = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  final memberNameController = TextEditingController();
  final taskNameController = TextEditingController();
  bool frequency = false;
  FrequencyTask? frequencyTask = FrequencyTask.Everyday;
  final periodController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    categoryNameController.dispose();
    memberNameController.dispose();
    taskNameController.dispose();
    periodController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.only(top: 41, left: 20, right: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: categoryNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Category'),
                ),
                const SizedBox(height: 29),
                TextFormField(
                  controller: memberNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Member Name'),
                ),
                const SizedBox(height: 29),
                TextFormField(
                  controller: taskNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Task Name'),
                ),
                const SizedBox(height: 29),
                RadioListTile<FrequencyTask>(
                    title: const Text('Everyday'),
                    value: FrequencyTask.Everyday,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;
                      });
                    }),
                RadioListTile<FrequencyTask>(
                    title: const Text('Every Week'),
                    value: FrequencyTask.EveryWeek,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;
                      });
                    }),
                if (frequencyTask == FrequencyTask.EveryWeek) _periodAndDate(),
                RadioListTile<FrequencyTask>(
                    title: const Text('Every Month'),
                    value: FrequencyTask.EveryMonth,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;
                      });
                    }),
                if (frequencyTask == FrequencyTask.EveryMonth) _periodAndDate(),
                RadioListTile<FrequencyTask>(
                    title: const Text('Every Year'),
                    value: FrequencyTask.EveryYear,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;
                      });
                    }),
                if (frequencyTask == FrequencyTask.EveryYear) _periodAndDate(),
                const SizedBox(height: 29),
                TextFormField(
                  controller: timeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Time'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 42),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _periodAndDate() {
    return Column(
      children: [
        TextFormField(
          controller: periodController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(labelText: 'Period'),
        ),
        const SizedBox(height: 29),
        TextFormField(
          controller: dateController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(labelText: 'Selected Date'),
        ),
      ],
    );
  }
}
