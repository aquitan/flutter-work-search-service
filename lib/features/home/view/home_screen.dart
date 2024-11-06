import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        SearchRoute(),
        WorksRoute(),
        OrdersRoute(),
        ChatRoute(),
        BlogRoute(),
      ],
      builder: (context, child) {
        final theme = Theme.of(context);
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              unselectedIconTheme: theme.iconTheme.copyWith(color: Colors.grey),
              selectedIconTheme:
                  theme.iconTheme.copyWith(color: theme.primaryColor),
              selectedItemColor: theme.primaryColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _onTabOpen(index, tabsRouter),
              items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(

                    icon: Icon(
                      Icons.search,
                    ),
                    label: 'Поиск'),
            BottomNavigationBarItem(
                icon: Icon(
                      Icons.headset_mic_outlined,
                ),
                tooltip: 'Работы',
                label: 'Работы'),
            BottomNavigationBarItem(
                icon: Icon(
                      Icons.qr_code,
                ),
                label: 'Заказы'),
            BottomNavigationBarItem(
                icon: Icon(
                      Icons.chat_bubble_outline_rounded,
                ),
                label: 'Чат'),
            BottomNavigationBarItem(
                icon: Icon(
                      Icons.view_carousel_outlined,
                ),
                label: 'Стройжурнал'),
          ]),
        );
      },
    );
  }

  void _onTabOpen(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
