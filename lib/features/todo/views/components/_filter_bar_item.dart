part of 'package:todo/features/todo/views/widgets/filter_bar.dart';

class _FilterBarItem extends ConsumerWidget {
  final String text;
  final TodoFilter filter;

  const _FilterBarItem({
    required this.filter,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => ref.read(todoFilterProvider.notifier).state = filter,
      child: Text(
        text,
        style: TextStyle(
          color: ref.watch(todoFilterProvider) == filter
              ? null
              : ApplicationColors.grey,
        ),
      ),
    );
  }
}
