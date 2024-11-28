import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/bloc/userBloc/bloc/user_bloc.dart';
import 'package:ia_ma/features/search/bloc/search_bloc.dart';
import 'package:ia_ma/features/search/widgets/widgets.dart';
import 'package:ia_ma/repository/token/token_repository_interface.dart';
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
    getToken();
    BlocProvider.of<UserBloc>(context).add(GetMe());
    BlocProvider.of<CategoriesBloc>(context).add(GetAllCategories());
    BlocProvider.of<SearchBloc>(context)
        .add(GetSearchedPublications(take: '20', skip: '0'));
    super.initState();
  }

  void getToken() async {
    var token = await GetIt.I<TokenRepositoryInterface>().getToken();
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
              // if (state is UserStateError) {
              //   logOut();
              //   AutoRouter.of(context).replaceAll([AuthRoute()]);
              // }
            },
            builder: (context, state) {
              if (state is UserStateLoaded) {
                final user = state.myUser.user;
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
                      AutoRouter.of(context).push(ProfileRoute(id: user.id!));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: CustomAvatar(
                        radius: 20.0,
                        bordered: true,
                        isOnline: true,
                        initials: '${user.firstName![0]}${user.lastName![0]}',
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
          SliverToBoxAdapter(
            child: SearchbarButton(
              onTap: () {
                _showModalBottomSheet(context);
              },
            ),
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
                    cardType: 'auction',
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

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    final theme = Theme.of(context);

    List<Map<String, dynamic>> categories = [
      {
        'title': 'Потолки',
        'img': 'assesets/images/1.jpg',
        'checked': true,
        'id': 1
      },
      {
        'title': 'Потолки',
        'img': 'assesets/images/1.jpg',
        'checked': true,
        'id': 2
      },
      {
        'title': 'Потолки',
        'img': 'assesets/images/1.jpg',
        'checked': true,
        'id': 3
      },
      {
        'title': 'Потолки',
        'img': 'assesets/images/1.jpg',
        'checked': true,
        'id': 4
      },
      {
        'title': 'Потолки',
        'img': 'assesets/images/1.jpg',
        'checked': true,
        'id': 5
      },
      {
        'title': 'Потолки',
        'img': 'assesets/images/1.jpg',
        'checked': true,
        'id': 6
      },
    ];

    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Container(
          padding: const EdgeInsets.only(
              top: 5.0, left: 16.0, right: 16.0, bottom: 16.0),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: [
              BottomSheetDragMark(),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Все услуги', style: theme.textTheme.titleMedium),
                  Text(
                    'Выбрать всё',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              TextField(
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    label: Text(
                      'Найти специализацию',
                      style: TextStyle(color: Color.fromRGBO(161, 161, 170, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Color.fromRGBO(110, 119, 129, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Color.fromRGBO(110, 119, 129, 1)))),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     border: Border.all(color: Colors.grey, width: 2.0
              // 				),
              //   ),
              //   child: TextField(decoration: InputDecoration()),
              // ),
              SizedBox(
                height: 22,
              ),
              Expanded(
                  child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      'Мои специализации',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 12.0,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          leading: CustomAvatar(radius: 20.0),
                          title: Text(categories[index]['title']),
                          trailing: CustomCheckbox(
                              value: categories[index]['checked']),
                        );
                      },
                      childCount: categories.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text('Другие специализации'),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          leading: CustomAvatar(radius: 20.0),
                          title: Text(categories[index]['title']),
                          trailing: CustomCheckbox(
                              value: categories[index]['checked']),
                        );
                      },
                      childCount: categories.length,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
