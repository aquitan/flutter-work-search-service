import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class OrdersAppBarFilter extends StatelessWidget {
  const OrdersAppBarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0),
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
            CustomChip(
              text: 'Все',
              bgColor: theme.colorScheme.tertiaryFixedDim,
            ),
            SizedBox(width: 8.0),
            CustomChip(
              text: 'Активные',
              bgColor: theme.colorScheme.tertiaryFixedDim,
            ),
            SizedBox(width: 8.0),
            CustomChip(
              text: 'История',
              bgColor: theme.colorScheme.tertiaryFixedDim,
            ),
            SizedBox(width: 8.0),
            CustomChip(
              text: 'Выполняются',
              bgColor: theme.colorScheme.tertiaryFixedDim,
            ),
            SizedBox(width: 8.0),
            CustomChip(
              text: 'Завершённые успешно',
              bgColor: theme.colorScheme.tertiaryFixedDim,
            ),
            SizedBox(width: 8.0),
            CustomChip(
              text: 'Завершённые неуспешно',
              bgColor: theme.colorScheme.tertiaryFixedDim,
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
