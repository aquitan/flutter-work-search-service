import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 130.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Logo(
              width: 80.0,
              height: 50.0,
              alignment: Alignment.bottomCenter,
            ),
            centerTitle: true,
            expandedTitleScale: 1.3,
          ),
          leading: CustomAvatar(),
          leadingWidth: 80.0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.orange,
                ),
                onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchbarButton(
            onTap: () {
              showModalBottomSheet(
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
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 4.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                            width: double.infinity,
                            child:
                                Column(children: [Text('Hello bottom sheet')])),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaler: const TextScaler.linear(5)),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
