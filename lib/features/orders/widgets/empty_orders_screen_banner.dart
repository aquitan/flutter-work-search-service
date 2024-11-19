import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/router/router.dart';

class EmptyOrdersScreenBanner extends StatelessWidget {
  const EmptyOrdersScreenBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverFillRemaining(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/no-documents.svg'),
              SizedBox(
                height: 24.0,
              ),
              Text('У вас пока нет размещённых заказов '),
              SizedBox(
                height: 24.0,
              ),
              FilledButton(
                  style: ButtonStyle(
                      maximumSize: WidgetStatePropertyAll(Size(223.0, 56.0)),
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
                            colorFilter: ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
