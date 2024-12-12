import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/bloc/userBloc/bloc/user_bloc.dart';
import 'package:ia_ma/features/orders/bloc/orders_bloc.dart';
import 'package:ia_ma/features/orders/widgets/widgets.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetMe());
    BlocProvider.of<OrdersBloc>(context).add(GetMyOrders(take: 20, skip: 0));
  }

  String filter = '';

  void onChangeFilter(String value) {
    setState(() {
      filter = value;

      switch (value) {
        case 'Активные':
          BlocProvider.of<OrdersBloc>(context)
              .add(GetMyOrders(take: 20, skip: 0, state: 2));
        case '':
          BlocProvider.of<OrdersBloc>(context)
              .add(GetMyOrders(take: 20, skip: 0));
        default:
          BlocProvider.of<OrdersBloc>(context)
              .add(GetMyOrders(take: 20, skip: 0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserStateLoaded) {

        }
      },
      child: Stack(
        children: [
          CustomScrollView(slivers: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserStateLoaded) {
                  final user = state.myUser.data;
                  return SliverAppBar(
                    pinned: true,
                    backgroundColor: theme.appBarTheme.backgroundColor,
                    surfaceTintColor: Colors.transparent,
                    centerTitle: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(100.0),
                      child: OrdersAppBarFilter(
                        filter: filter,
                        onChangeFilter: onChangeFilter,
                      ),
                    ),
                    title: Text(
                      'Мои заказы',
                      style: theme.textTheme.titleMedium,
                    ),
                    leading: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(ProfileRoute(id: user.id));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: CustomAvatar(
                          radius: 20.0,
                          bordered: true,
                          isOnline: true,
                          initials:
                              '${user.firstName![0]}${user.lastName?[0] ?? ''}',
                          networkImg: user.avatar != null
                              ? '${dotenv.env['YA_MA_CDN']}${user.avatar}'
                              : null,
                        ),
                      ),
                    ),
                    leadingWidth: 60.0,
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.notifications_none),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            Icons.qr_code,
                            color: theme.primaryColor,
                          ),
                          onPressed: () {}),
                    ],
                  );
                }
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),

            BlocBuilder<OrdersBloc, OrdersBlocState>(builder: (context, state) {
              if (state is OrdersBlocStateLoaded) {
                final ordersList = state.orders;
                return SliverList.builder(
                  itemCount: ordersList!.length,
                  itemBuilder: (context, index) {
                    final card = ordersList[index];
                    return PublicataionCard(
                      order: card,
                    );
                  },
                );
              }

              return EmptyOrdersScreenBanner();
            }),
            // if (emptyList)
            //   EmptyOrdersScreenBanner(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 80.0,
              ),
            ),
          ]),
          BottomOrdersFloatingButton(),
        ],
      ),
    );
  }
}
