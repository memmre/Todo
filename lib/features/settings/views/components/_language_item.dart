part of 'package:todo/features/settings/views/pages/settings_page.dart';

class _LanguageItem extends ConsumerWidget {
  const _LanguageItem();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Locale locale = ref.watch(settingsProvider).locale;
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(ApplicationStrings.language),
      trailing: DropdownButton<Locale>(
        underline: Container(),
        value: locale,
        items: [
          DropdownMenuItem(
            value: const Locale('en'),
            child: Text(ApplicationStrings.english),
          ),
          DropdownMenuItem(
            value: const Locale('tr'),
            child: Text(ApplicationStrings.turkish),
          ),
        ],
        onChanged: (locale) {
          if (locale != null) {
            ref.read(settingsProvider.notifier).updateLocale(locale);
          }
        },
      ),
    );
  }
}
