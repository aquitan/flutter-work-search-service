import 'package:flutter/material.dart';

class OrderTypeSelectionBlocks extends StatelessWidget {
  const OrderTypeSelectionBlocks({
    super.key,
    required this.selectedType,
    required this.offerCheckbox,
    required this.regularOrderTextFieldController,
    required this.setRadioValue,
  });

  final String selectedType;
  final bool offerCheckbox;
  final TextEditingController regularOrderTextFieldController;
  final Function(String value) setRadioValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Выберите тип заказа',
          style: theme.textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                border:
                    Border.all(width: 1.0, color: theme.colorScheme.tertiary),
              ),
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Radio(
                        value: 'auction',
                        groupValue: selectedType,
                        onChanged: (String? value) {
                          setRadioValue(value!);
                          // setState(() {
                          //   selectedType = value!;
                          // });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Аукцион',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                if (selectedType == 'auction')
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Разыграем ваш заказ на аукционе и подберём оптимальную стоимость работ, всего за 300 ₽',
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: theme.colorScheme.secondary),
                          ),
                          SizedBox(height: 8.0),
                          Text('Укажите максимальный бюджет'),
                          TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.currency_ruble),
                                  isDense: true,
                                  label: Text(
                                    'Введите сумму',
                                    style: TextStyle(
                                        color: theme.colorScheme.tertiary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: theme.colorScheme.tertiary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: theme.colorScheme.tertiary)))),
                          SizedBox(height: 8.0),
                          Text('Укажите шаг к ставке (на понижение)'),
                          TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.currency_ruble),
                                  isDense: true,
                                  label: Text(
                                    'Введите сумму ставки',
                                    style: TextStyle(
                                        color: theme.colorScheme.tertiary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: theme.colorScheme.tertiary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: theme.colorScheme.tertiary))))
                        ],
                      ),
                    ),
                  )
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                border:
                    Border.all(width: 1.0, color: theme.colorScheme.tertiary),
              ),
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Radio(
                        value: 'offer',
                        groupValue: selectedType,
                        onChanged: (String? value) {
                          setRadioValue(value!);
                          // setState(() {
                          //   selectedType = value!;
                          // });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Встречное предложение',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                if (selectedType == 'offer')
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Text(
                              'Мастер сразу рассчитает и укажет стоимость работ при отклике на заказ, всего за 100 ₽ '),
                          Row(
                            children: [
                              Checkbox(
                                  value: offerCheckbox,
                                  onChanged: (bool? value) {
                                    // setState(() {
                                    //   offerCheckbox = !value!;
                                    // });
                                  }),
                              Expanded(
                                  child:
                                      Text('Мастера видят предложенные цены'))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                border:
                    Border.all(width: 1.0, color: theme.colorScheme.tertiary),
              ),
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Radio(
                        value: 'regular',
                        groupValue: selectedType,
                        onChanged: (String? value) {
                          setRadioValue(value!);
                          // setState(() {
                          //   selectedType = value!;
                          // });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Обычный заказ',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                if (selectedType == 'regular')
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'О стоимости работ вы договоритесь с мастером, когда выберите его кандидатом в исполнители',
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: theme.colorScheme.secondary),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Желаемая цена за услугу'),
                          SizedBox(
                            height: 4.0,
                          ),
                          TextField(
                              controller: regularOrderTextFieldController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.currency_ruble),
                                  isDense: true,
                                  label: Text(
                                    'Введите вашу цену',
                                    style: TextStyle(
                                        color: theme.colorScheme.tertiary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: theme.colorScheme.tertiary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: theme.colorScheme.tertiary))))
                        ],
                      ),
                    ),
                  )
              ])),
        ),
      ],
    );
  }
}
