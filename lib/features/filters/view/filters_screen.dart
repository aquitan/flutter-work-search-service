import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<Map<String, dynamic>> testCategoryNumbers = [
    {'id': 114, 'title': 'Вентиляция и кондиционеры'},
    {'id': 530, 'title': 'Окна'},
    {'id': 527, 'title': 'Навесы и тенты'},
    {'id': 350, 'title': 'Лестницы'},
    {'id': 827, 'title': 'Потолки'}
  ];

  final List<Map<String, dynamic>> orderTypes = [
    {'id': 1, 'type': 'all', 'title': 'Все', 'selected': true},
    {'id': 1, 'type': 'auction', 'title': 'Аукцион', 'selected': false},
    {'id': 1, 'type': 'normal', 'title': 'Обычный заказ', 'selected': false},
    {
      'id': 1,
      'type': 'price_offer',
      'title': 'Встречное предложение',
      'selected': false
    },
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Фильтры',
          textAlign: TextAlign.center,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: GestureDetector(child: Text('Сбросить')),
              )
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          BlockWrapper(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Виды услуг',
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 2.0,
                    runSpacing: 2.0,
                    children: [
                      for (var i = 0; i < testCategoryNumbers.length; i++)
                        CustomChip(
                          bgColor: theme.colorScheme.tertiaryFixedDim,
                          textColor: Colors.black,
                          text: testCategoryNumbers[i]['title'],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          avatar: CustomAvatar(
                            radius: 60,
                            localImg:
                                'assets/categories/category_${testCategoryNumbers[i]['id']}.png',
                          ),
                        )
                    ]),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          BlockWrapper(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Дата заказа',
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDatePicker(
                            locale: Locale('ru'),
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 48.0,
                          width: 148.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  width: 2.0,
                                  color: theme.colorScheme.tertiary)),
                          child: Text(
                            '01.01.2024',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: theme.colorScheme.tertiary),
                          )),
                    ),
                    SizedBox(
                      child: SvgPicture.asset('assets/icons/dash.svg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDatePicker(
                            locale: Locale('ru'),
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 48.0,
                        width: 148.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                width: 2.0, color: theme.colorScheme.tertiary)),
                        child: Text('01.01.2024',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.tertiary)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Text(
                  'Адрес выполнения',
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.center,
                  height: 48.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          width: 2.0, color: theme.colorScheme.tertiary)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Укажите адрес заказа',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.tertiary)),
                        SvgPicture.asset(
                          'assets/icons/location-mark.svg',
                          width: 24.0,
                          height: 24.0,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          BlockWrapper(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Тип заказа',
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 2.0,
                    runSpacing: 2.0,
                    children: [
                      for (var i = 0; i < orderTypes.length; i++)
                        CustomChip(
                          bgColor: orderTypes[i]['selected']
                              ? theme.colorScheme.secondary
                              : theme.colorScheme.tertiaryFixedDim,
                          textColor: orderTypes[i]['selected']
                              ? Colors.white
                              : Colors.black,
                          text: orderTypes[i]['title'],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        )
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
