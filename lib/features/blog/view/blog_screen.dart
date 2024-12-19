import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/bloc/myUserBloc/bloc/my_user_bloc.dart';
import 'package:ia_ma/features/blog/widgets/widgets.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<MyUserBloc>(context).add(GetMe());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: [
      CustomScrollView(
        slivers: [
          BlocBuilder<MyUserBloc, MyUserState>(
            builder: (context, state) {
              if (state is UserStateLoaded) {
                final user = state.myUser.data;
                return SliverAppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  surfaceTintColor: Colors.transparent,
                  pinned: true,
                  title: Text(
                    'Стройжурнал',
                    style: theme.textTheme.titleMedium,
                  ),
                  snap: true,
                  floating: true,
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
                        icon: CustomSvgImage(
                            assetName: 'assets/icons/filter-icon.svg'),
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
    ]);
  }
}


