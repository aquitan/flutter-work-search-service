import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key});

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Публикация'),
      ),
      body: Stack(children: [
        ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                decoration: BoxDecoration(
                    color: theme.cardTheme.color,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24.0)),
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
                                    SvgPicture.asset(
                                        'assets/icons/date-icon.svg'),
                                    SizedBox(width: 4.0),
                                    Text(
                                      '20 окт–13 нбр ',
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.grey),
                                    ),
                                    SizedBox(width: 24.0),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/eye-icon.svg'),
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
                            Text(
                              'Спецтехника',
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomChip(
                          fontSize: 14.0,
                          bgColor: theme.colorScheme.secondaryFixedDim,
                          textColor: theme.colorScheme.secondary,
                          text: 'В поиске исполнителя',
                          avatar: SvgPicture.asset(
                              'assets/icons/magnifying-glass-icon.svg'),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clock-icon.svg',
                              width: 14.0,
                              height: 14.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              '2 дня до закрытия',
                              style: theme.textTheme.bodySmall,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Text(
                        'Нужно расчитстить территорию от деревьев, выкорчевать пни и выровнять землю',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                    SizedBox(height: 12.0),
                    SizedBox(
                      height: 108,
                      child: CarouselView(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          itemExtent: 88,
                          children: List.generate(8, (int index) {
                            return ColoredBox(
                                color: theme.colorScheme.secondaryFixedDim,
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    'https://otvet.imgsmail.ru/download/287836_88195aec6441674311982056978bfcfb_800.jpg'));
                          })),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                        'Необходимо демонтировать 6 межкомнатных дверей, установить под ключ 3 межкомнатные двери и одну для ванной.'),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/location-mark.svg'),
                        SizedBox(width: 8.0),
                        Text('Липецк, ул. Циолковского')
                      ],
                    )
                  ],
                ))
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: FilledButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                  primaryFlat,
                )),
                onPressed: () {},
                child: SizedBox(
                  width: 300.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/qr-code-icon.svg'),
                      SizedBox(width: 8),
                      Text(
                        'Сгенерировать QR-код',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500, color: primaryColor),
                      )
                    ],
                  ),
                )),
          ),
        )
      ]),
    );
  }
}
