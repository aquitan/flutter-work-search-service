import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/bloc/myUserBloc/bloc/my_user_bloc.dart';
import 'package:ia_ma/features/orders/widgets/empty_orders_screen_banner.dart';
import 'package:ia_ma/features/works/bloc/works_bloc.dart';
import 'package:ia_ma/features/works/widgets/widgets.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/custom_avatar.dart';
import 'package:ia_ma/ui/widgets/publicataion_card.dart';


@RoutePage()
class WorksScreen extends StatefulWidget {
  const WorksScreen({super.key});

  @override
  State<WorksScreen> createState() => _WorksScreenState();
}



class _WorksScreenState extends State<WorksScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyUserBloc>(context).add(GetMe());
    BlocProvider.of<WorksBloc>(context).add(GetAllWorks());
  }

  String filter = '';

  void onChangeFilter(String value) {
    setState(() {
      filter = value;

      switch (value) {
        case 'Я кандидат':
          BlocProvider.of<WorksBloc>(context).add(GetMyWorks());
        case '':
          BlocProvider.of<WorksBloc>(context).add(GetAllWorks());
        default:
          BlocProvider.of<WorksBloc>(context).add(GetAllWorks());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
        children: [
          CustomScrollView(slivers: [
          BlocBuilder<MyUserBloc, MyUserState>(
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
                    child: WorksAppBarFilter(
                        filter: filter, onChangeFilter: onChangeFilter),
                    ),
                    title: Text(
                      'Мои работы',
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

            BlocBuilder<WorksBloc, WorksState>(builder: (context, state) {
              if (state is WorksBlocStateLoaded) {
                final worksList = state.works;
                return SliverList.builder(
                  itemCount: worksList!.length,
                  itemBuilder: (context, index) {
                    final card = worksList[index];
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
          BottomWorksFloatingButton(),
      ],
    );
  }
}
