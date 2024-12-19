import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/helpers/date_parser.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class PublicataionCard extends StatefulWidget {
  const PublicataionCard(
      {super.key,
      this.btn = false,
      required this.order});

  final bool btn;
  final Order order;

  @override
  State<PublicataionCard> createState() => _PublicataionCardState();
}

class _PublicataionCardState extends State<PublicataionCard> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final order = widget.order;

    void onTapPublication(int id, int userId) {
      AutoRouter.of(context)
          .push(PublicationRoute(id: id, publicationUserId: order.userId!));
    }

    return GestureDetector(
      onTap: () {
        onTapPublication(order.id!, order.userId!);
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
                                '${parseDate(order.workBeginDate)!} ${order.workEndDate != null ? '-' : ""} ${order.workEndDate != null ? parseDate(order.workEndDate) : ""}',
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
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
              SizedBox(height: 12.0),
              if (order.user != null)
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
                                '${order.user!.firstName} ${order.user!.lastName ?? ''}',
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
                          Container(
                            constraints: BoxConstraints(maxWidth: 200.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/location-mark.svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    '${order.address}',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                )
                              ],
                            ),
                        ),
                      ],
                    ),
                    CustomAvatar(
                      radius: 24.0,
                        initials:
                            '${order.user!.firstName![0]}${order.user!.lastName?[0] ?? ''}',
                        networkImg: order.user!.avatar != null
                            ? '${dotenv.env['YA_MA_CDN']}${order.user!.avatar}'
                            : null,
                    ),
                  ]),
              SizedBox(height: 12.0),
              PublicationCardPriceType(
                isTender: order.isTender,
                price: order.price,
                startPrice: order.startPrice,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (order.state == 1)
                    CustomChip(
                      fontSize: 14.0,
                      bgColor: theme.colorScheme.secondaryFixedDim,
                      textColor: theme.colorScheme.secondary,
                      text: 'В поиске исполнителя',
                      avatar: SvgPicture.asset(
                          'assets/icons/magnifying-glass-icon.svg'),
                    ),
                  if (order.state == 2)
                    CustomChip(
                      fontSize: 14.0,
                      bgColor: theme.colorScheme.secondaryFixedDim,
                      textColor: theme.colorScheme.primaryFixedDim,
                      text: 'Выполняется',
                      avatar: SvgPicture.asset(
                          'assets/icons/lighlightning-icon.svg'),
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
