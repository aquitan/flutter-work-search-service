import 'package:flutter/material.dart';
import 'package:ia_ma/features/orders/widgets/widgets.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';

Future<dynamic> showCategoriesBotomshitTrigger(
    BuildContext context, CategoriesModel categories) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) {
        return OrderCategoriesBottomsheet(
          categoriesList: categories,
        );
      });
}
