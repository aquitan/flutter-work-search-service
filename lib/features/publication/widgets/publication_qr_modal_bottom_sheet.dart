import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class PublicationQrModalBottomSheet extends StatelessWidget {
  const PublicationQrModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 60.0),
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
              height: 18,
            ),
            Expanded(
                child: ListView(
              children: [
                Text(
                  'Подтвердите сделку',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: theme.colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Image.asset('assets/images/qr_code.png'),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'На встрече с мастером ',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'отсканируйте QR-коды друг друга',
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Text(
                      '✦ подтверждает, что реальные личности соответствуют профилям',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                    Text(
                      '✦ гарантия проведенной сделки, мы помогаем решать споры',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                    Text(
                      '✦ исключает умышленное представление под чужим профилем, безопасные встречи',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.primary),
                    'Альтернативное подтверждение',
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
