import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ProfileRecomendationsCarousel extends StatelessWidget {
  const ProfileRecomendationsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.0, bottom: 24.0, top: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => SizedBox(
          width: 8.0,
        ),
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(16.0),
              height: 240,
              width: 300,
              decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomAvatar(
                        radius: 24.0,
                        localImg: 'assets/categories/2.png',
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дорад Симферополев',
                            style: theme.textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '01 февраля ‘24, 10:35',
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: theme.colorScheme.secondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                      'Ирина заплатила вовремя, работать было комфортно. Долго подписывали договор, потому что Ирина 3 дня не отвечала на сообшения, за это снял одну звезду.')
                ],
              ));
        },
      ),
    );
  }
}
