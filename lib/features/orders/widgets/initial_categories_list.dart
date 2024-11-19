import 'package:flutter/material.dart';
import 'package:ia_ma/features/orders/methods/show_categories_botomsheet_trigger.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class InitialCategoriesList extends StatelessWidget {
  const InitialCategoriesList(
      {super.key,
      required this.categories,
      required this.selectedCategorie,
      required this.theme,
      required this.selectCategory});

  final CategoriesModel categories;
  final int? selectedCategorie;
  final ThemeData theme;
  final Function(CategoriesModel, int) selectCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        spacing: 4.0,
        children: [
          for (int i = 0; i < 3; i++)
            GestureDetector(
              onTap: () {
                selectCategory(categories, i);
              },
              child: CustomChip(
                selected: categories.data[i].id == selectedCategorie,
                padding: 0.0,
                bgColor: theme.colorScheme.tertiaryFixedDim,
                borderColor: categories.data[i].id == selectedCategorie
                    ? theme.colorScheme.primary
                    : null,
                borderWidth:
                    categories.data[i].id == selectedCategorie ? 1 : null,
                textColor: Colors.black,
                text: categories.data[i].name,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                avatar: CustomAvatar(
                  radius: 60,
                  localImg:
                      'assets/categories/category_${categories.data[i].id}.png',
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              showCategoriesBotomshitTrigger(context, categories);
            },
            child: CustomChip(
              text: 'Показать все',
              borderWidth: 1.0,
              borderColor: theme.colorScheme.tertiary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
          )
        ],
      ),
    );
  }
}
