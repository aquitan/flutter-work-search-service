import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ActiveSession extends StatelessWidget {
  const ActiveSession(
      {super.key,
      required this.type,
      required this.session,
      required this.browser});

  final String type;
  final String session;
  final String browser;

  String checkDeviceType() {
    if (type == 'mobile') {
      return 'assets/icons/device-phone-mobile.svg';
    } else {
      return 'assets/icons/computer-desktop-icon.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 12.0,
          children: [
            CustomSvgImage(assetName: checkDeviceType()),
            Expanded(
              child: Text(
                session,
                style: theme.textTheme.bodySmall,
              ),
            ),
            CustomSvgImage(assetName: 'assets/icons/logout-icon.svg')
          ],
        ),
        Text(
          browser,
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.tertiary),
        ),
      ],
    );
  }
}
