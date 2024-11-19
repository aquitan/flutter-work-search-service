import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPhotoBigArea extends StatelessWidget {
  const AddPhotoBigArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DottedBorder(
        borderType: BorderType.RRect,
        strokeCap: StrokeCap.round,
        radius: Radius.circular(12),
        color: theme.colorScheme.tertiary,
        dashPattern: [5, 2],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/plus-icon.svg',
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.tertiary, BlendMode.srcIn),
                ),
                Text('Добавьте фото',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.tertiary))
              ],
            ),
          ),
        ));
  }
}
