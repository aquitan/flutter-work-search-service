import 'package:flutter/material.dart';

class SearchbarButton extends StatelessWidget {
  const SearchbarButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
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
      ),
    );
  }
}
