import 'package:flutter/material.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class OrderCategoriesBottomsheet extends StatefulWidget {
  const OrderCategoriesBottomsheet({super.key, required this.categoriesList});

  final CategoriesModel categoriesList;

  @override
  State<OrderCategoriesBottomsheet> createState() =>
      _OrderCategoriesBottomsheetState();
}

class _OrderCategoriesBottomsheetState
    extends State<OrderCategoriesBottomsheet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 60),
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
            Center(
              child: BottomSheetDragMark(),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Выберите подходящую категорию',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CustomChip(
                            padding: 0.0,
                            bgColor: theme.colorScheme.tertiaryFixedDim,
                            avatar: CustomAvatar(
                                radius: 60,
                                localImg:
                                    'assets/categories/category_${widget.categoriesList.data[index].id}.png'),
                            text: widget.categoriesList.data[index].name);
                      },
                      childCount: widget.categoriesList.data.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
