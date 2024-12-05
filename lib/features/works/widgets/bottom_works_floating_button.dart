import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class BottomWorksFloatingButton extends StatelessWidget {
  const BottomWorksFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomFloatingButtons(children: [
      FilledButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
            theme.colorScheme.primary,
          )),
          onPressed: () {},
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/magnifying-glass-icon.svg',
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                SizedBox(width: 8),
                Text(
                  'Искать работу',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          ))
    ]);
  }
}
