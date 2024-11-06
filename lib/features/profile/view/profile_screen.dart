import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Профиль'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/elipsis-horizontal.svg',
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ))
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Container(
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
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomAvatar(
                            bordered: true,
                            networkImg:
                                'https://i.pinimg.com/736x/8c/ed/f9/8cedf96e02c73abda694f5d0bc6f6990.jpg',
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ProfileRatings()
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Инга Полосатая',
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset('assets/icons/virified-icon.svg')
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/location-mark.svg',
                              colorFilter: ColorFilter.mode(
                                  Colors.grey, BlendMode.srcIn)),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'г. Липецк',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: theme.colorScheme.tertiary),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('На сайте c',
                                      style: TextStyle(
                                          color: theme.colorScheme.secondary)),
                                  Text(
                                    '05.11.2024',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: theme.colorScheme.tertiary),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Опыт работы',
                                      style: TextStyle(
                                          color: theme.colorScheme.secondary)),
                                  Text(
                                    '22 года',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: theme.colorScheme.tertiary),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Завершено',
                                      style: TextStyle(
                                          color: theme.colorScheme.secondary)),
                                  Text(
                                    '0',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          FilledButton(
                              style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all(
                                    Size(double.infinity, 48.0)),
                                backgroundColor: WidgetStatePropertyAll(
                                    theme.colorScheme.secondaryFixedDim),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/pencil-square-icon.svg',
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Редактировать профиль',
                                    style: theme.textTheme.bodyMedium,
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 8.0,
                          ),
                          IconButton.filled(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      theme.colorScheme.secondaryFixedDim),
                                  fixedSize: WidgetStatePropertyAll(Size(
                                    48.0,
                                    48.0,
                                  ))),
                              icon: SvgPicture.asset(
                                  'assets/icons/share-arrow.svg'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ProfileBlogTrigger(),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/recomendations-icon.svg',
                      width: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text('Рекомендации', style: theme.textTheme.titleLarge),
                    SizedBox(width: 8.0),
                    Text('4',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: theme.colorScheme.secondary)),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ProfileRecomendationsCarousel()
            ],
          ),
        ]));
  }
}
