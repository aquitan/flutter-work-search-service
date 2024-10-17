import 'package:flutter/material.dart';

class SearchbarButton extends StatelessWidget {
  SearchbarButton({super.key, required this.onTap});

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(width: 8.0),
            Text('Найти работу по категории',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
