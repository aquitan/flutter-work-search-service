import 'package:flutter/material.dart';

import 'search_category_slide.dart';

class SearchScreenSearchBlock extends StatelessWidget {
  const SearchScreenSearchBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          color: Colors.white,
        ),
        child: SizedBox(
          height: 92,
          width: 150,
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) => SearchCategorySlide()),
        ),
      ),
    ]);
  }
}
