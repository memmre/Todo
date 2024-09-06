import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/features/todo/view_models/todo_list_view_model.dart';

class NewTodoField extends ConsumerWidget {
  const NewTodoField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: ApplicationStrings.inputMessage,
        suffixIcon: IconButton(
          icon: const Icon(Icons.done),
          onPressed: () {
            if (controller.text.isNotEmpty) {
              ref.read(todoListProvider.notifier).add(controller.text.trim());
              controller.clear();
            }
          },
        ),
      ),
    );
  }
}
