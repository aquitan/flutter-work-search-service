import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


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
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 12.0),
            decoration: BoxDecoration(
              boxShadow: null,
              color: theme.cardColor,
              border: Border(
                  top: BorderSide(
                width: 1.0,
                color: theme.colorScheme.tertiary,
              )),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: theme.cardColor,
                unselectedIconTheme:
                    theme.iconTheme.copyWith(color: Colors.grey),
                selectedIconTheme:
                    theme.iconTheme.copyWith(color: theme.primaryColor),
                selectedItemColor: theme.primaryColor,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) => _onTabOpen(index, tabsRouter),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                          'assets/icons/menu-search-icon.svg',
                          width: 33.0,
                          height: 33.0,
                          colorFilter: ColorFilter.mode(
                              theme.primaryColor, BlendMode.srcIn)),
                      icon: SvgPicture.asset(
                        'assets/icons/magnifying-glass-icon.svg',
                        width: 33.0,
                        height: 33.0,
                      ),
                      label: 'Поиск'),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                          'assets/icons/hardhat-icon.svg',
                          width: 33.0,
                          height: 33.0,
                          colorFilter: ColorFilter.mode(
                              theme.primaryColor, BlendMode.srcIn)),
                      icon: SvgPicture.asset(
                        'assets/icons/hardhat-icon.svg',
                        width: 33.0,
                        height: 33.0,
                      ),
                      tooltip: 'Работы',
                      label: 'Работы'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/orders-icon.svg',
                        width: 33.0,
                        height: 33.0,
                      ),
                      label: 'Заказы'),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset('assets/icons/chat-icon.svg',
                          width: 33.0,
                          height: 33.0,
                          colorFilter: ColorFilter.mode(
                              theme.primaryColor, BlendMode.srcIn)),
                      icon: SvgPicture.asset(
                        'assets/icons/chat-icon.svg',
                        width: 33.0,
                        height: 33.0,
                      ),
                      label: 'Чат'),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset('assets/icons/blog-icon.svg',
                          width: 33.0,
                          height: 33.0,
                          colorFilter: ColorFilter.mode(
                              theme.primaryColor, BlendMode.srcIn)),
                      icon: SvgPicture.asset(
                        'assets/icons/blog-icon.svg',
                        width: 33.0,
                        height: 33.0,
                      ),
                      label: 'Стройжурнал'),
                ]),
          ),
        );
      },
    );
  }

  void _onTabOpen(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
