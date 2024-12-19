import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class WorksAppBarFilter extends StatelessWidget {
  WorksAppBarFilter(
      {
    super.key,
    required this.filter, required this.onChangeFilter
  });

  final String filter;
  Function onChangeFilter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 100.0,
      child: Column(
        children: [
          Expanded(
            child: BlockWrapper(
              offset: Offset(0.0, 6.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0)),
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      style: ButtonStyle(
                          maximumSize: WidgetStatePropertyAll(
                            Size(56.0, 56.0),
                          ),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                          backgroundColor: WidgetStatePropertyAll(
                              theme.colorScheme.tertiaryFixedDim)),
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/filter-icon.svg',
                          width: 24.0,
                          height: 24.0,
                          colorFilter: ColorFilter.mode(
                              theme.iconTheme.color!, BlendMode.srcIn))),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => onChangeFilter(''),
                    child: CustomChip(
                      text: 'Все',
                      bgColor: filter.isEmpty
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.tertiaryFixedDim,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => onChangeFilter('Выполняются'),
                    child: CustomChip(
                      text: 'Выполняются',
                      bgColor: filter == 'Выполняются'
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.tertiaryFixedDim,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => onChangeFilter('Я кандидат'),
                    child: CustomChip(
                    text: 'Я кандидат',
                      bgColor: filter == 'Я кандидат'
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.tertiaryFixedDim,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => onChangeFilter('Мои отклики'),
                    child: CustomChip(
                    text: 'Мои отклики',
                      bgColor: filter == 'Мои отклики'
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.tertiaryFixedDim,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => onChangeFilter('История работ'),
                    child: CustomChip(
                    text: 'История работ',
                      bgColor: filter == 'История работ'
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.tertiaryFixedDim,
                    ),
                  ),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Выполняются',
                  style: theme.textTheme.titleLarge,
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/arrows_up_down.svg',
                          width: 24.0,
                          height: 24.0,
                          colorFilter: ColorFilter.mode(
                              theme.iconTheme.color!, BlendMode.srcIn)),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/magnifying-glass-icon.svg',
                        width: 24.0,
                        height: 24.0,
                        colorFilter: ColorFilter.mode(
                            theme.iconTheme.color!, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
