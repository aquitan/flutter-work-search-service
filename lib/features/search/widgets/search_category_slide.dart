import 'package:flutter/material.dart';

class SearchCategorySlide extends StatelessWidget {
  const SearchCategorySlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 92.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(234, 238, 242, 1),
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
              image: AssetImage('assets/categories/3.png'),
              alignment: Alignment.bottomRight)),
      child: Text('Отделочные работы',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
    );
  }
}
