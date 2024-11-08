import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/search/widgets/search_category_slide.dart';
import 'package:ia_ma/router/router.dart';
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
          backgroundColor: theme.appBarTheme.backgroundColor,
          surfaceTintColor: Colors.transparent,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Logo(
              width: 40.0,
              height: 30.0,
              alignment: Alignment.bottomCenter,
            ),
            centerTitle: true,
            expandedTitleScale: 1.8,
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
            IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.qr_code,
                  color: theme.primaryColor,
                ),
                onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
          child: SearchbarButton(
            onTap: () {
              _showModalBottomSheet(context);
            },
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              color: theme.cardTheme.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 0), //
                )
              ]
          ),
          child: SizedBox(
            height: 92,
            width: 150,
            child: ListView.separated(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) => SearchCategorySlide()),
          ),
        )),
        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return PublicataionCard(
                cardType: 'price_offer',
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
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
