import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class CategorySelectionTab extends StatelessWidget {
  const CategorySelectionTab(
      {super.key, required this.listIds, required this.selectCategory});

  final List<int> listIds;
  final Function selectCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Text(
          'Вы мастер? Умеете и хотите выполнять заказы по строительсву и ремонту?',
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.secondary),
        ),
        SizedBox(height: 24.0),
        Text(
          'Укажите, какие виды работ вы выполняете',
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(height: 4.0),
        Text(
          'Для поиска подходящих заказов рекомендуем указать (выбрать из предложенных) направления и услуги, которые вы можете оказывать',
          style: theme.textTheme.bodySmall,
        ),
        SizedBox(height: 24.0),
        Text(
          'Выберите подходящую категорию',
          style: theme.textTheme.bodyMedium,
        ),
        BlocBuilder<CategoriesBloc, CategoriesBlocState>(
            builder: (context, state) {
          if (state is CategoriesLoaded) {
            final categories = state.categories.data;
            return Wrap(
              spacing: 4.0,
              children: [
                for (var i = 0; i < categories.length; i++)
                  GestureDetector(
                    onTap: () {
                      selectCategory(categories[i].id);
                    },
                    child: CustomChip(
                      bgColor: theme.colorScheme.tertiaryFixedDim,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      text: categories[i].name,
                      borderColor: listIds.any((id) => id == categories[i].id)
                          ? theme.colorScheme.primary
                          : null,
                      selected: listIds.any((id) => id == categories[i].id),
                      borderWidth: 1.0,
                      avatar: CustomAvatar(
                        localImg:
                            'assets/categories/category_${categories[i].id}.png',
                      ),
                    ),
                  ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
        SizedBox(
          height: 24.0,
        ),
        CustomButton(
            onTap: () {}, text: 'Сохранить', radius: 56.0, height: 56.0)
      ],
    );
  }
}
