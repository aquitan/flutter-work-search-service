import 'package:flutter/material.dart';

class SearchCategorySlide extends StatelessWidget {
  const SearchCategorySlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 150.0,
      height: 92.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
              image: AssetImage('assets/categories/3.png'),
              alignment: Alignment.bottomRight)),
      child: Text('Отделочные работы',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
