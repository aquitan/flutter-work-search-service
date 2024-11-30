import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OrderDetailedTypeIndicator extends StatelessWidget {
  const OrderDetailedTypeIndicator({
    super.key,
    required this.isTender,
    this.price,
    required this.startPrice,
  });

  final String? isTender;
  final int? price;
  final String startPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<Widget> selectOrderType() {
      var formattedPrice = NumberFormat.currency(locale: "ru_RU", symbol: "₽");
      final startPriceParsed =
          int.parse(startPrice.isNotEmpty ? startPrice : '0');
      if (isTender == null) {
        return [
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryFixedDim,
                borderRadius: BorderRadius.circular(24.0)),
            child: SvgPicture.asset(
              'assets/icons/banknotes-icon.svg',
              width: 24.0,
              height: 25.0,
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Цена',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.colorScheme.secondary),
              ),
              Text(
                formattedPrice.format(price),
                style: theme.textTheme.titleLarge,
              )
            ],
          )
        ];
      } else if (isTender == 'auction') {
        return [
          SvgPicture.asset(
            'assets/icons/auction-icon.svg',
            width: 24.0,
            height: 25.0,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Аукцион, макс. бюджет'),
              Text(
                formattedPrice.format(startPriceParsed),
                style: theme.textTheme.titleLarge,
              )
            ],
          )
        ];
      } else {
        return [
          SvgPicture.asset(
            'assets/icons/calculator-icon.svg',
            width: 24.0,
            height: 25.0,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Встречное предложение'),
              Text('Жду оценки мастера')
            ],
          )
        ];
      }
    }

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.tertiary, width: 1.0),
          borderRadius: BorderRadius.circular(24.0)),
      child: Row(
        children: selectOrderType(),
      ),
    );
  }
}
