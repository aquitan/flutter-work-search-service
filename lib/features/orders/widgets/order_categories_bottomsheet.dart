import 'package:flutter/material.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class OrderCategoriesBottomsheet extends StatefulWidget {
  const OrderCategoriesBottomsheet(
      {super.key,
      required this.categoriesList,
      required this.setState,
      this.selectedCategorie,
      required this.selectCategory});

  final CategoriesModel categoriesList;
  final int? selectedCategorie;
  final Function(CategoriesModel, int) selectCategory;
  final StateSetter setState;

  @override
  State<OrderCategoriesBottomsheet> createState() =>
      _OrderCategoriesBottomsheetState();
}

class _OrderCategoriesBottomsheetState
    extends State<OrderCategoriesBottomsheet> {

  List<Category> catList = [];
  int? selectedCat;

  @override
  void initState() {
    // TODO: implement initState

    catList = widget.categoriesList.data;
    selectedCat = widget.selectedCategorie;
    super.initState();
  }

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
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            widget.selectCategory(widget.categoriesList, index);
                            widget.setState(() {
                              selectedCat = catList[index].id;
                            });
                          },

                          child: Row(
                            children: [
                              CustomChip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0)),
                                  selected: catList[index].id == selectedCat,
                                  padding: 0.0,
                                  bgColor: theme.colorScheme.tertiaryFixedDim,
                                  borderColor: catList[index].id == selectedCat
                                      ? theme.colorScheme.primary
                                      : null,
                                  borderWidth: catList[index].id == selectedCat
                                      ? 1
                                      : null,
                                  avatar: CustomAvatar(
                                      radius: 60,
                                      localImg:
                                          'assets/categories/category_${widget.categoriesList.data[index].id}.png'),
                                  text: widget.categoriesList.data[index].name),
                            ],
                          ));
                    },
                    itemCount: widget.categoriesList.data.length,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
