import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class BottomOrdersFloatingButton extends StatelessWidget {
  const BottomOrdersFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomFloatingButtons(children: [
      FilledButton(
          onPressed: () {},
          child: FilledButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                theme.colorScheme.primary,
              )),
              onPressed: () {
                AutoRouter.of(context).push(OrderCreationRoute());
              },
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Разместить заказ',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset('assets/icons/plus-icon.svg',
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                  ],
                ),
              )))
    ]);
  }
}
