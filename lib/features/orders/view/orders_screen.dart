import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    BlocProvider.of<OrdersBloc>(context).add(GetMyOrders());
  }

  @override
  Widget build(BuildContext context) {
    bool emptyList = false;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: OrdersAppBarFilter(),
        ),
        title: Text(
          'Мои заказы',
        ),
        leading: GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(ProfileRoute(id: 1));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomAvatar(
              radius: 20.0,
              bordered: true,
              isOnline: true,
              networkImg:
                  'https://i.pinimg.com/736x/8c/ed/f9/8cedf96e02c73abda694f5d0bc6f6990.jpg',
            ),
          ),
        ),
        leadingWidth: 60.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.qr_code,
                color: theme.primaryColor,
              ),
              onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),


            BlocConsumer<OrdersBloc, OrdersBlocState>(
                listener: (context, state) {
              if (state is OrdersBlocStateLoaded) {
                setState(() {
                  emptyList = true;
                });
              }
            }, builder: (context, state) {
              if (state is OrdersBlocStateLoaded) {
                final ordersList = state.orders;
                return SliverList.builder(
                  itemCount: ordersList!.length,
                  itemBuilder: (context, index) {
                    final card = ordersList[index];
                    return PublicataionCard(
                      cardType: 'auction',
                      order: card,
                    );
                  },
                );

              }
              if (state is OrdersBlocStateLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
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
