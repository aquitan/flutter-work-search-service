import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PublicationCardPriceType extends StatelessWidget {
  const PublicationCardPriceType(
      {super.key, this.isTender, this.price, this.startPrice});

  final String? isTender;
  final int? price;
  final String? startPrice;

  @override
  Widget build(BuildContext context) {
    var formattedPrice = NumberFormat.currency(locale: "ru_RU", symbol: "₽");
    checkCardType() {
      final theme = Theme.of(context);
      if (isTender == 'auction') {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/auction-icon.svg'),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Аукцион',
                  style: TextStyle(color: theme.colorScheme.secondary),
                )
              ],
            ),
            Text(
              price != null ? formattedPrice.format(price) : 'Договорная',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        );
      } else if (isTender == 'price_offer') {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              SvgPicture.asset('assets/icons/calculator-icon.svg'),
              SizedBox(
                width: 6,
              ),
              Text(
                'Встр. предл.',
                style: TextStyle(color: theme.colorScheme.secondary),
              )
            ]),
            Text(
              price != null ? formattedPrice.format(price) : 'Договорная',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            SvgPicture.asset('assets/icons/banknotes-icon.svg'),
            SizedBox(
              width: 6,
            ),
            Text(
              'Цена',
              style: TextStyle(color: theme.colorScheme.secondary),
            )
          ]),
          Text(
            price != null ? formattedPrice.format(price) : 'Договорная',
            style: theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    return Container(
      child: checkCardType(),
    );
  }
}
