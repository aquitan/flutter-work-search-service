import 'package:flutter/material.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

Future<dynamic> showModalBottomSheetFn(
    BuildContext context, UserCategories userCategories) {
  final theme = Theme.of(context);
  final idList = [];

  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Container(
        width: double.infinity,
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
                          width: 2.0, color: Color.fromRGBO(110, 119, 129, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          width: 2.0,
                          color: Color.fromRGBO(110, 119, 129, 1)))),
            ),
            SizedBox(
              height: 22,
            ),
            Expanded(
                child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Text(
                  'Мои специализации',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 12.0,
                ),
              ),
              if (userCategories.data!.isNotEmpty)
                SliverList.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: theme.colorScheme.secondaryFixedDim))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomAvatar(
                                    localImg:
                                        'assets/categories/category_${userCategories.data![index].id}.png',
                                    radius: 20.0),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(userCategories.data![index].name),
                              ],
                            ),
                            Checkbox(
                                side: BorderSide(width: 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                value: false,
                                onChanged: (value) =>
                                    idList.add(userCategories.data![index].id))
                          ]),
                    );
                  },
                  itemCount: userCategories.data!.length,
                ),
              if (userCategories.data!.isEmpty)
                SliverToBoxAdapter(
                  child: Text(
                    'У вас не выбраны категории',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.colorScheme.secondary),
                  ),
                )
            ]))
            // Expanded(
            //     child: CustomScrollView(
            //   slivers: [
            //     SliverToBoxAdapter(
            //       child: Text(
            //         'Мои специализации',
            //         style: TextStyle(fontSize: 14.0),
            //       ),
            //     ),
            //     SliverToBoxAdapter(
            //       child: SizedBox(
            //         height: 12.0,
            //       ),
            //     ),
            //     SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //           return ListTile(
            //             leading: CustomAvatar(radius: 20.0),
            //             title: Text(categories[index]['title']),
            //             trailing:
            //                 CustomCheckbox(value: categories[index]['checked']),
            //           );
            //         },
            //         childCount: categories.length,
            //       ),
            //     ),
            //     SliverToBoxAdapter(
            //       child: SizedBox(
            //         height: 16,
            //       ),
            //     ),
            //     SliverToBoxAdapter(
            //       child: Text('Другие специализации'),
            //     ),
            //     SliverToBoxAdapter(
            //       child: SizedBox(
            //         height: 16,
            //       ),
            //     ),
            //     SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //           return ListTile(
            //             leading: CustomAvatar(radius: 20.0),
            //             title: Text(categories[index]['title']),
            //             trailing:
            //                 CustomCheckbox(value: categories[index]['checked']),
            //           );
            //         },
            //         childCount: categories.length,
            //       ),
            //     ),
            //   ],
            // ))
          ],
        ),
      ),
    ),
  );
}
