import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/bloc/userBloc/bloc/user_bloc.dart';
import 'package:ia_ma/bloc/userCategories/bloc/user_categories_bloc.dart';
import 'package:ia_ma/features/search/bloc/search_bloc.dart';
import 'package:ia_ma/features/search/methods/show_modal_bottomsheet.dart';
import 'package:ia_ma/features/search/widgets/widgets.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetMe());
    BlocProvider.of<UserCategoriesBloc>(context).add(GetUserCategories());
    BlocProvider.of<CategoriesBloc>(context).add(GetAllCategories());
    BlocProvider.of<SearchBloc>(context)
        .add(GetSearchedPublications(take: '20', skip: '0'));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    logOut() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove('token');
      pref.clear();
    }

    return Stack(children: [
      CustomScrollView(
        slivers: [
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserStateLoaded) {
                return;
              }
              if (state is UserStateError) {
                logOut();
                AutoRouter.of(context).replaceAll([AuthRoute()]);
              }
            },
            builder: (context, state) {
              if (state is UserStateLoaded) {
                final user = state.myUser.data;
                return SliverAppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  surfaceTintColor: Colors.transparent,
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 150.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Logo(
                      width: 50.0,
                      height: 40.0,
                      alignment: Alignment.bottomCenter,
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.8,
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
                        icon: Icon(Icons.notifications_none), onPressed: () {}),
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
          BlocBuilder<UserCategoriesBloc, UserCategoriesState>(
              builder: (context, state) {
            if (state is UserCategoriesLoaded) {
              final userCategories = state.categories;
              return SliverToBoxAdapter(
                child: SearchbarButton(
                  onTap: () {
                    showModalBottomSheetFn(context, userCategories);
                  },
                ),
              );
            }
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
					),
          BlocBuilder<CategoriesBloc, CategoriesBlocState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                final categories = state.categories;
                return SliverToBoxAdapter(
                    child: SearchScreenSearchBlock(categories: categories));
              }
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is SearchStateLoaded) {
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
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }),
          SliverToBoxAdapter(
            child: SizedBox(height: 60),
          ),
        ],
      ),
      BottomFloatingButtons(
        children: [
          FilledButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                theme.colorScheme.primary,
              )),
              onPressed: () {
                AutoRouter.of(context).push(FiltersRoute());
              },
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/filter-icon.svg',
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                    SizedBox(width: 8),
                    Text(
                      'Фильтры',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 10.0,
          ),
          FilledButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                theme.colorScheme.primary,
              )),
              onPressed: () {},
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/map-icon.svg',
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                    SizedBox(width: 8),
                    Text(
                      'На карте',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      )
    ]);
  }


}
