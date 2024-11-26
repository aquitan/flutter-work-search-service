import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailedTypeIndicator extends StatelessWidget {
  const OrderDetailedTypeIndicator({
    super.key,
    required this.isTender,
    required this.price,
  });

  final bool isTender;
  final int? price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<Widget> selectOrderType() {
      if (!isTender && price != null) {
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
                '$price ₽',
                style: theme.textTheme.titleLarge,
              )
            ],
          )
        ];
      } else if (isTender) {
        return [
          SvgPicture.asset(
            'assets/icons/auction-icon.svg',
            width: 24.0,
            height: 25.0,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Аукцион, макс. бюджет'), Text('$price')],
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
            children: [Text('Аукцион, макс. бюджет'), Text('$price')],
          )
        ];
      }
    }

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.secondary, width: 1.0),
          borderRadius: BorderRadius.circular(24.0)),
      child: Row(
        children: selectOrderType(),
      ),
    );
  }
}
