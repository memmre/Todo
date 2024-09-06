part of 'package:todo/features/todo/views/widgets/todo_list.dart';

class _TodoListItem extends ConsumerWidget {
  final bool seperator;
  final Todo todo;

  const _TodoListItem({
    required this.todo,
    this.seperator = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      background: _buildBackground(),
      key: Key(todo.id),
      onDismissed: (direction) {
        ref.read(todoListProvider.notifier).delete(todo.id);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) {
                ref.read(todoListProvider.notifier).toggle(todo.id);
              },
            ),
            title: Text(todo.title),
          ),
          if (seperator)
            Container(
              color: ApplicationColors.grey,
              height: 0.5,
            ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      color: ApplicationColors.red,
      child: const Icon(
        Icons.delete,
        color: ApplicationColors.white,
      ),
    );
  }
}
