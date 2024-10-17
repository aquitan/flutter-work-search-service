import 'package:flutter/material.dart';
import 'package:ia_ma/features/search/view/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchScreen(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                label: 'Поиск'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.grey,
                ),
                label: 'Работы'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.grey,
                ),
                label: 'Заказы'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.grey,
                ),
                label: 'Чат'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.view_carousel_outlined,
                  color: Colors.grey,
                ),
                label: 'Стройжурнал'),
          ]),
    );
  }
}
