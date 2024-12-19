import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class BlogBottomMenu extends StatelessWidget {
  const BlogBottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        height: 64.0,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(color: theme.cardTheme.color),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            IconButton(
                color: theme.colorScheme.primary,
                style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                    backgroundColor:
                        WidgetStatePropertyAll(theme.colorScheme.primary)),
                onPressed: () {},
                icon: CustomSvgImage(
                  assetName: 'assets/icons/pencil-square-icon.svg',
                  color: Colors.white,
                )),
            SizedBox(
              width: 12.0,
            ),
            CustomButton(
              onTap: () {},
              text: 'Мои публикации',
              radius: 12.0,
              height: 40.0,
              color: theme.colorScheme.tertiaryFixedDim,
              width: 192.0,
              textStyle: 'small',
              textColor: iconsBlack,
              icon: CustomSvgImage(
                assetName: 'assets/icons/user-icon.svg',
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            CustomButton(
              onTap: () {},
              text: 'Мои подписки',
              radius: 12.0,
              height: 40.0,
              color: theme.colorScheme.tertiaryFixedDim,
              width: 192.0,
              textStyle: 'small',
              textColor: iconsBlack,
              icon: CustomSvgImage(
                assetName: 'assets/icons/users-group-icon.svg',
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            CustomButton(
              onTap: () {},
              text: 'Сохраненные статьи',
              radius: 12.0,
              height: 40.0,
              color: theme.colorScheme.tertiaryFixedDim,
              width: 220.0,
              textStyle: 'small',
              textColor: iconsBlack,
              icon: CustomSvgImage(
                assetName: 'assets/icons/bookmark-icon.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
