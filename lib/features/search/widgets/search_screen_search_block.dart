import 'package:flutter/material.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

import 'search_category_slide.dart';

class SearchScreenSearchBlock extends StatelessWidget {
  const SearchScreenSearchBlock({super.key, required this.categories});

  final CategoriesModel categories;

  @override
  Widget build(BuildContext context) {
    return BlockWrapper(
      padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      child: SizedBox(
        height: 92,
        width: 150,
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.count,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) => SearchCategorySlide(
                  categorie: categories.data[index],
                )),
      ),
    );
  }
}
