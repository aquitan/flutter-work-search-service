import 'package:flutter/material.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';

class SearchCategorySlide extends StatelessWidget {
  const SearchCategorySlide({super.key, required this.categorie});

  final Category categorie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 150.0,
        height: 92.0,
      decoration: BoxDecoration(
          color: theme.colorScheme.tertiaryFixedDim,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/categories/category_${categorie.id}.png',
                height: 60.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categorie.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        )
    );
  }
}
