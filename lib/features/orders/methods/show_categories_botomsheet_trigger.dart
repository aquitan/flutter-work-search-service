import 'package:flutter/material.dart';
import 'package:ia_ma/features/orders/widgets/widgets.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';

Future<dynamic> showCategoriesBotomshitTrigger(
    BuildContext context,
    CategoriesModel categories,
    int? selectedCategorie,
    Function(CategoriesModel, int) selectCategory) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return OrderCategoriesBottomsheet(
              categoriesList: categories,
              selectedCategorie: selectedCategorie,
              selectCategory: selectCategory,
              setState: setState
          );
        });
      });
}
