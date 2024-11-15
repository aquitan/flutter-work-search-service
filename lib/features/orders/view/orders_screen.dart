import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final bool emptyList = true;
    final theme = Theme.of(context);
    return Stack(
      children: [
        CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            surfaceTintColor: Colors.transparent,
            pinned: true,
            centerTitle: true,
            title: Text(
              'Мои заказы',
            ),
            leading: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(ProfileRoute());
              },
              child: CustomAvatar(
                networkImg:
                    'https://i.pinimg.com/736x/8c/ed/f9/8cedf96e02c73abda694f5d0bc6f6990.jpg',
              ),
            ),
            leadingWidth: 80.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications_none), onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.qr_code,
                    color: theme.primaryColor,
                  ),
                  onPressed: () {}),
            ],
          ),
          if (emptyList)
            SliverFillRemaining(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/no-documents.svg'),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text('У вас пока нет размещённых заказов '),
                      SizedBox(
                        height: 24.0,
                      ),
                      FilledButton(
                          style: ButtonStyle(
                              maximumSize:
                                  WidgetStatePropertyAll(Size(223.0, 56.0)),
                              backgroundColor: WidgetStatePropertyAll(
                                theme.colorScheme.primary,
                              )),
                          onPressed: () {
                            AutoRouter.of(context).push(OrderCreationRoute());
                          },
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Разместить заказ',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset('assets/icons/plus-icon.svg',
                                    colorFilter: ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn)),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),

          // Remove
          if (!emptyList)
            SliverToBoxAdapter(
                child: BlockWrapper(
                    padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 40.0,
                        child: OrdersAppBarFilter(),
                      ),
                    )))
        ]),

        //Remove
        if (!emptyList)
          BottomFloatingButtons(children: [
            FilledButton(
                onPressed: () {},
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      theme.colorScheme.primary,
                    )),
                    onPressed: () {},
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Разместить заказ',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          SvgPicture.asset('assets/icons/plus-icon.svg',
                              colorFilter: ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)),
                        ],
                      ),
                    )))
          ])
      ],
    );
  }
}

class OrdersAppBarFilter extends StatelessWidget {
  const OrdersAppBarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        IconButton(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0))),
                backgroundColor:
                    WidgetStatePropertyAll(theme.colorScheme.tertiaryFixedDim)),
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/filter-icon.svg',
                colorFilter:
                    ColorFilter.mode(theme.iconTheme.color!, BlendMode.srcIn))),
        SizedBox(width: 8.0),
        CustomChip(
          text: 'Все',
          bgColor: theme.colorScheme.tertiaryFixedDim,
        ),
        SizedBox(width: 8.0),
        CustomChip(
          text: 'Активные',
          bgColor: theme.colorScheme.tertiaryFixedDim,
        ),
        SizedBox(width: 8.0),
        CustomChip(
          text: 'История',
          bgColor: theme.colorScheme.tertiaryFixedDim,
        ),
        SizedBox(width: 8.0),
        CustomChip(
          text: 'Выполняются',
          bgColor: theme.colorScheme.tertiaryFixedDim,
        ),
        SizedBox(width: 8.0),
        CustomChip(
          text: 'Завершённые успешно',
          bgColor: theme.colorScheme.tertiaryFixedDim,
        ),
        SizedBox(width: 8.0),
        CustomChip(
          text: 'Завершённые неуспешно',
          bgColor: theme.colorScheme.tertiaryFixedDim,
        ),
        SizedBox(width: 8.0),
      ],
    );
  }
}
