import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/bloc/locationsBloc/bloc/locations_bloc.dart';
import 'package:ia_ma/features/blog/widgets/widgets.dart';
import 'package:ia_ma/features/profile/bloc/profile_bloc.dart';
import 'package:ia_ma/repository/locations/models/locations_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:intl/intl.dart';

@RoutePage()
class BlogUserScreen extends StatefulWidget {
  const BlogUserScreen({super.key, required this.userId});

  final int userId;

  @override
  State<BlogUserScreen> createState() => _BlogUserScreenState();
}

class _BlogUserScreenState extends State<BlogUserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ProfileBloc>(context).add(GetUserById(id: widget.userId));
    BlocProvider.of<LocationsBloc>(context).add(GetAllLocations());
  }

  int? cityId;
  Location? location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(listener: (context, state) {
          if (state is ProfileStateLoaded) {
            final user = state.user;
            setState(() {
              cityId = user.locationId;
            });
          }
        }),
        BlocListener<LocationsBloc, LocationsState>(
          listener: (context, state) {
            if (state is LocationsLoaded) {
              final locations = state.locations;

              setState(() {
                location = locations.data
                    .firstWhere((element) => element.id == cityId);
              });
            }
          },
        )
      ],
      child: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: theme.appBarTheme.backgroundColor,
              surfaceTintColor: Colors.transparent,
              pinned: true,
              title: Text(
                'C—Ж',
                style: theme.textTheme.titleMedium,
              ),
              snap: true,
              floating: true,
              leadingWidth: 60.0,
              actions: <Widget>[
                IconButton(
                    icon: CustomSvgImage(
                        assetName: 'assets/icons/filter-icon.svg'),
                    onPressed: () {}),
              ],
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileStateLoaded) {
                  final user = state.user;
                  final DateTime createdAt = DateTime.parse(user.createdAt);

                  return SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                        ),
                        color: theme.cardTheme.color,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 12.0,
                            children: [
                              CustomAvatar(
                                bordered: true,
                                initials:
                                    '${user.firstName![0]}${user.lastName?[0] ?? ''}',
                                networkImg: user.avatar != null
                                    ? '${dotenv.env['YA_MA_CDN']}${user.avatar}'
                                    : null,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlogUserRates(rating: user.rating),
                                  Text(
                                    '${user.firstName} ${user.lastName ?? ''}',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  Text(location != null
                                      ? 'г. ${location!.name} '
                                      : '')
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 8.0,
                            children: [
                              InfoUserChip(
                                  child: DateFormat('dd-MM-yyyy')
                                      .format(createdAt),
                                  title: 'На сайте'),
                              InfoUserChip(child: '0', title: 'Публикации'),
                              InfoUserChip(child: '0', title: 'Подписчики'),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: BlogCard(),
              ),
            )
          ],
        ),
        // Blog Bottom Menu ///////////////////////////////////////
        //
        BlogBottomMenu()
      ]),
    );
  }
}
