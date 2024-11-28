import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/features/profile/bloc/profile_bloc.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.id});

  final int id;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(GetUserById(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text('Профиль'),
          actions: [
            IconButton(
                onPressed: () {
                  _showSimpleModalDialog(context);
                },
                icon: SvgPicture.asset(
                  'assets/icons/elipsis-horizontal.svg',
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ))
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileStateLoaded) {
              final profile = state.user;
              final DateTime createdAt = DateTime.parse(profile.createdAt);

              return ListView(children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: theme.cardTheme.color,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 24.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomAvatar(
                                  bordered: true,
                                  networkImg:
                                      '${dotenv.env['YA_MA_CDN']}${profile.avatar}',
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                ProfileRatings()
                              ],
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${profile.firstName} ${profile.lastName}',
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/virified-icon.svg')
                              ],
                            ),
                            SizedBox(height: 8.0),
                            if (profile.locationId != null)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/location-mark.svg',
                                      colorFilter: ColorFilter.mode(
                                          Colors.grey, BlendMode.srcIn)),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'г. Липецк',
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                          color: theme.colorScheme.tertiary),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('На сайте c',
                                            style: TextStyle(
                                                color: theme
                                                    .colorScheme.secondary)),
                                        Text(
                                          DateFormat('dd-MM-yyyy')
                                              .format(createdAt),
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                          color: theme.colorScheme.tertiary),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Опыт работы',
                                            style: TextStyle(
                                                color: theme
                                                    .colorScheme.secondary)),
                                        Text(
                                          '22 года',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                          color: theme.colorScheme.tertiary),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Завершено',
                                            style: TextStyle(
                                                color: theme
                                                    .colorScheme.secondary)),
                                        Text(
                                          '0',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                FilledButton(
                                    style: ButtonStyle(
                                      fixedSize: WidgetStateProperty.all(
                                          Size(double.infinity, 48.0)),
                                      backgroundColor: WidgetStatePropertyAll(
                                          theme.colorScheme.secondaryFixedDim),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/pencil-square-icon.svg',
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Редактировать профиль',
                                          style: theme.textTheme.bodyMedium,
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  width: 8.0,
                                ),
                                IconButton.filled(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            theme
                                                .colorScheme.secondaryFixedDim),
                                        fixedSize: WidgetStatePropertyAll(Size(
                                          48.0,
                                          48.0,
                                        ))),
                                    icon: SvgPicture.asset(
                                        'assets/icons/share-arrow.svg'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileBlogTrigger(),
                    SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/recomendations-icon.svg',
                            width: 24.0,
                          ),
                          SizedBox(width: 8.0),
                          Text('Рекомендации',
                              style: theme.textTheme.titleLarge),
                          SizedBox(width: 8.0),
                          Text('4',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: theme.colorScheme.secondary)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ProfileRecomendationsCarousel()
                  ],
                ),
              ]);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

_showSimpleModalDialog(context) {
  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    pref.clear();
  }

  final theme = Theme.of(context);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topRight,
          child: Container(
            height: 420.0,
            width: 300.0,
            padding: EdgeInsets.all(16.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/user-icon.svg'),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Личные данные',
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/verify-outlined-icon.svg'),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Верификация личности',
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/wrench-icon.svg'),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Я Мастер',
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/bell-alert-icon.svg'),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Уведомления',
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    AutoRouter.of(context).push(ProfileThemeRoute());
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/color-scheme-icon.svg'),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Цветовая тема',
                        style: theme.textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/cog-6-tooth-icon.svg'),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Настройки',
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                        'assets/icons/information-circle-icon.svg'),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'О приложении',
                      style: theme.textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 36.0,
                ),
                GestureDetector(
                  onTap: () {
                    logOut();
                    AutoRouter.of(context).replaceAll([AuthRoute()]);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/logout-icon.svg'),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Выйти',
                        style: theme.textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
