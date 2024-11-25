import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:intl/intl.dart';

class PublicataionCard extends StatefulWidget {
  const PublicataionCard(
      {super.key,
      required this.cardType,
      this.btn = false,
      required this.order});

  final String cardType;
  final bool btn;
  final Order order;

  @override
  State<PublicataionCard> createState() => _PublicataionCardState();
}

class _PublicataionCardState extends State<PublicataionCard> {
  List<Widget>? _checkCardType() {
    if (widget.cardType == 'auction') {
      return [
        SvgPicture.asset('assets/icons/auction-icon.svg'),
        SizedBox(
          width: 4,
        ),
        Text('Аукцион')
      ];
    } else if (widget.cardType == 'price_offer') {
      return [
        SvgPicture.asset('assets/icons/auction-icon.svg'),
        SizedBox(
          width: 4,
        ),
        Text('Ваше предл.')
      ];
    }
    return [
      SvgPicture.asset('assets/icons/auction-icon.svg'),
      SizedBox(
        width: 4,
      ),
      Text('Цена')
    ];
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int id = 1;

    final order = widget.order;
    final dateStartParsed = DateTime.parse(order.workBeginDate!);
    final formatter = DateFormat('dd.MM.yyyy');
    final dateStart = formatter.format(dateStartParsed);
    final dateEnd = formatter.format(dateStartParsed);

    void onTapPublication(int id) {
      AutoRouter.of(context).push(PublicationRoute());
    }

    return GestureDetector(
      onTap: () {
        onTapPublication(id);
      },
      child: Container(
        decoration: BoxDecoration(
            color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomAvatar(
                    radius: 24.0,
                    localImg:
                        'assets/categories/category_${order.categoryId!}.png',
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/date-icon.svg'),
                              SizedBox(width: 4.0),
                              Text(
                                '$dateStart ',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey),
                              ),
                              SizedBox(width: 24.0),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/eye-icon.svg'),
                              SizedBox(width: 4.0),
                              Text(
                                '20',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      if (order.category != null)
                        Text(
                          order.category!.name,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                  order.title!,
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
              SizedBox(height: 12.0),
              Text(
                'Заказчик',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              if (order.user != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/virified-icon.svg'),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                                '${order.user!.firstName!} ${order.user!.lastName!}',
                              style: theme.textTheme.bodySmall,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/filled-star-icon.svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                  Text(order.user!.rating.toString())
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/location-mark.svg'),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                                '${order.address}',
                              style: theme.textTheme.bodySmall,
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomAvatar(
                      radius: 24.0,
                        networkImg:
                            'https://cdn.test.ya-ma.ru/${order.user!.avatar}',
                    ),
                  ]),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: _checkCardType()!.toList(),
                  ),
                  Text(
                    '${order.price != null ? order.price.toString() : 0} ₽',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomChip(
                    text: 'Выполняется',
                    bgColor: Color.fromRGBO(253, 239, 234, 1),
                    avatar: SvgPicture.asset('assets/icons/lightning-icon.svg'),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/clock-icon.svg'),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '2 дня',
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: widget.btn ? 12.0 : 0),
              widget.btn
                  ? OutlinedButton(
                      style: ButtonStyle(
                          side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.grey.shade300, width: 2.0),
                          ),
                          minimumSize:
                              WidgetStatePropertyAll(Size(double.infinity, 48)),
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/dialog-icon.svg',
                              colorFilter: ColorFilter.mode(
                                  Colors.grey, BlendMode.srcIn)),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Написать',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ))
                  : SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
