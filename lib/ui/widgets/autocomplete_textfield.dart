import 'package:flutter/material.dart';

class AutocompleteTextfield extends StatelessWidget {
  const AutocompleteTextfield({super.key, required this.options});

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return options.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('Вы уже выбрали $selection');
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.cardTheme.color,
            isDense: true,
            label: Text(
              'Город/ населённый пункт',
              style: theme.textTheme.bodyMedium,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    BorderSide(width: 1.0, color: theme.colorScheme.secondary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    BorderSide(width: 1.0, color: theme.colorScheme.tertiary)),
          ),
        );
      },
    );
  }
}
