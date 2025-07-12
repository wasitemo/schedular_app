import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedular_app_flutter/core/utils/input_validator.dart';
import 'package:schedular_app_flutter/feature/task/domain/entities/task_entity.dart';
import 'package:schedular_app_flutter/feature/task/presentation/widgets/input_field.dart';
import 'package:schedular_app_flutter/feature/task/presentation/widgets/period_and_date.dart';

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
  TimeOfDay? _selectedTime;

  void _timePicker() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        timeController.text = pickedTime.format(context);
      });
    }
  }

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
                InputField(
                    inputFieldController: categoryNameController,
                    validator: InputValidator.isValidInput,
                    label: 'Category Name'),
                const SizedBox(height: 29),
                InputField(
                  inputFieldController: memberNameController,
                  validator: InputValidator.isValidInput,
                  label: 'Member Name',
                ),
                const SizedBox(height: 29),
                InputField(
                    inputFieldController: taskNameController,
                    validator: InputValidator.isValidInput,
                    label: 'Task Name'),
                const SizedBox(height: 29),
                RadioListTile<FrequencyTask>(
                    title: const Text('Everyday'),
                    value: FrequencyTask.Everyday,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;

                        if (frequencyTask == FrequencyTask.Everyday) {
                          periodController.clear();
                          dateController.clear();
                        }
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

                        if (frequencyTask == FrequencyTask.Everyday) {
                          periodController.clear();
                          dateController.clear();
                        }
                      });
                    }),
                if (frequencyTask == FrequencyTask.EveryWeek)
                  PeriodAndDate(
                    periodController: periodController,
                    dateValidator: InputValidator.isValidInput,
                    periodLabel: 'Period',
                    dateController: dateController,
                    periodValidator: InputValidator.isValidInput,
                    dateLabel: 'Date',
                  ),
                RadioListTile<FrequencyTask>(
                    title: const Text('Every Month'),
                    value: FrequencyTask.EveryMonth,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;

                        if (frequencyTask == FrequencyTask.Everyday) {
                          periodController.clear();
                          dateController.clear();
                        }
                      });
                    }),
                if (frequencyTask == FrequencyTask.EveryMonth)
                  PeriodAndDate(
                    periodController: periodController,
                    dateValidator: InputValidator.isValidInput,
                    periodLabel: 'Period',
                    dateController: dateController,
                    periodValidator: InputValidator.isValidInput,
                    dateLabel: 'Date',
                  ),
                RadioListTile<FrequencyTask>(
                    title: const Text('Every Year'),
                    value: FrequencyTask.EveryYear,
                    groupValue: frequencyTask,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        frequencyTask = value;

                        if (frequencyTask == FrequencyTask.Everyday) {
                          periodController.clear();
                          dateController.clear();
                        }
                      });
                    }),
                if (frequencyTask == FrequencyTask.EveryYear)
                  PeriodAndDate(
                    periodController: periodController,
                    dateValidator: InputValidator.isValidInput,
                    periodLabel: 'Period',
                    dateController: dateController,
                    periodValidator: InputValidator.isValidInput,
                    dateLabel: 'Date',
                  ),
                const SizedBox(height: 29),
                TextFormField(
                  controller: timeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Time'),
                  readOnly: true,
                  onTap: _timePicker,
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
}
