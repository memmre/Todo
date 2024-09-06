part of 'package:todo/features/settings/views/pages/settings_page.dart';

class _ThemeItem extends ConsumerWidget {
  const _ThemeItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(settingsProvider).theme;
    return ListTile(
      leading: const Icon(Icons.color_lens),
      title: Text(ApplicationStrings.theme),
      trailing: DropdownButton<ThemeData>(
        underline: Container(),
        value: theme,
        items: [
          DropdownMenuItem(
            value: ApplicationTheme.light,
            child: Text(ApplicationStrings.light),
          ),
          DropdownMenuItem(
            value: ApplicationTheme.dark,
            child: Text(ApplicationStrings.dark),
          ),
        ],
        onChanged: (theme) {
          if (theme != null) {
            ref.read(settingsProvider.notifier).updateTheme(theme);
          }
        },
      ),
    );
  }
}
