import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class OrderCreationScreen extends StatefulWidget {
  const OrderCreationScreen({super.key});

  @override
  State<OrderCreationScreen> createState() => _OrderCreationScreenState();
}

class _OrderCreationScreenState extends State<OrderCreationScreen> {
  final TextEditingController titleController = TextEditingController();
  final List<File> _selectedImages = [];
  final List<String> typeValues = ['regular', 'auction', 'offer'];
  String selectedType = 'regular';
  bool offerCheckbox = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text('Создание заказа'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Назовите объявление', style: theme.textTheme.titleMedium),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  isDense: true,
                  label: Text(
                    'Название объявления',
                    style: TextStyle(color: theme.colorScheme.tertiary),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          width: 1.0, color: theme.colorScheme.tertiary)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          width: 1.0, color: theme.colorScheme.tertiary))),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('Выберите подходящую категорию',
                style: theme.textTheme.titleMedium),
            SizedBox(
              height: 12.0,
            ),
            SizedBox(
              child: Wrap(
                spacing: 4.0,
                children: [
                  CustomChip(
                    padding: 0.0,
                    bgColor: theme.colorScheme.tertiaryFixedDim,
                    textColor: Colors.black,
                    text: 'Двери',
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    avatar: CustomAvatar(
                      radius: 60,
                      localImg: 'assets/categories/category_224.png',
                    ),
                  ),
                  CustomChip(
                    padding: 0.0,
                    text: 'Лестницы',
                    bgColor: theme.colorScheme.tertiaryFixedDim,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    avatar: CustomAvatar(
                      radius: 60,
                      localImg: 'assets/categories/category_1035.png',
                    ),
                  ),
                  CustomChip(
                    padding: 0.0,
                    text: 'Окна',
                    bgColor: theme.colorScheme.tertiaryFixedDim,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    avatar: CustomAvatar(
                      radius: 60,
                      localImg: 'assets/categories/category_294.png',
                    ),
                  ),
                  CustomChip(
                    padding: 0.0,
                    text: 'Строительство',
                    bgColor: theme.colorScheme.tertiaryFixedDim,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    avatar: CustomAvatar(
                      radius: 60,
                      localImg: 'assets/categories/category_506.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'Укажите сроки',
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(
              height: 16.0,
            ),
            GestureDetector(
                onTap: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2026));
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/calendar-icon.svg'),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('Выберите дату'),
                  ],
                )),
            SizedBox(
              height: 32.0,
            ),
            Text('Что нужно сделать?', style: theme.textTheme.titleMedium),
            SizedBox(
              height: 12.0,
            ),
            TextField(
                minLines: 3,
                maxLines: 20,
                decoration: InputDecoration(
                    isDense: true,
                    label: Text(
                      'Опишите подробно, что нужно сделать',
                      style: TextStyle(color: theme.colorScheme.tertiary),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            width: 1.0, color: theme.colorScheme.tertiary)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            width: 1.0, color: theme.colorScheme.tertiary)))),
            SizedBox(
              height: 12.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.circular(14.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Как составить описание\u{00A0} ',
                          style: theme.textTheme.titleSmall,
                          children: [
                        TextSpan(
                            text: 'образец',
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: theme.colorScheme.tertiary)),
                      ])),
                  Icon(
                    Icons.chevron_right_outlined,
                    color: theme.colorScheme.tertiary,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text('Добавьте фото', style: theme.textTheme.titleMedium),
            SizedBox(
              height: 12.0,
            ),
            _selectedImages.isEmpty
                ? GestureDetector(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        strokeCap: StrokeCap.round,
                        radius: Radius.circular(12),
                        color: theme.colorScheme.tertiary,
                        dashPattern: [5, 2],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/plus-icon.svg',
                                  colorFilter: ColorFilter.mode(
                                      theme.colorScheme.tertiary,
                                      BlendMode.srcIn),
                                ),
                                Text('Добавьте фото',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        color: theme.colorScheme.tertiary))
                              ],
                            ),
                          ),
                        )),
                  )
                : SizedBox(
                    child: Wrap(
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: [
                      for (int i = 0; i < _selectedImages.length; i++)
                        Stack(children: [
                          Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0)),
                              width: 80.0,
                              height: 100.0,
                              child: Image.file(
                                _selectedImages[i],
                                fit: BoxFit.cover,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImages.removeAt(i);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.tertiaryFixedDim,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Icon(Icons.close),
                                )),
                          )
                        ]),
                      if (_selectedImages.length < 10)
                        Container(
                            height: 100.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: GestureDetector(
                              onTap: () {
                                _pickImageFromGallery();
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                strokeCap: StrokeCap.round,
                                radius: Radius.circular(12),
                                color: theme.colorScheme.tertiary,
                                dashPattern: [5, 2],
                                child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/plus-icon.svg',
                                      colorFilter: ColorFilter.mode(
                                          theme.colorScheme.tertiary,
                                          BlendMode.srcIn)),
                                ),
                              ),
                            )),
                    ],
                  )),
            SizedBox(height: 32.0),
            Text('Укажите адрес', style: theme.textTheme.titleMedium),
            SizedBox(height: 12.0),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  isDense: true,
                  label: Text(
                    'Адрес или район заказа',
                    style: TextStyle(color: theme.colorScheme.tertiary),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          width: 1.0, color: theme.colorScheme.tertiary)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          width: 1.0, color: theme.colorScheme.tertiary))),
            ),
            SizedBox(height: 32.0),
            Text('Выберите тип заказа'),
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlockWrapper(
                  padding: EdgeInsets.all(8.0),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                              setState(() {
                                selectedType = value!;
                              });
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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Разыграем ваш заказ на аукционе и подберём оптимальную стоимость работ, всего за 300 ₽',
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: theme.colorScheme.secondary),
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.tertiary)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: theme
                                                  .colorScheme.tertiary)))),
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.tertiary)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.tertiary))))
                            ],
                          ),
                        ),
                      )
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlockWrapper(
                  padding: EdgeInsets.all(8.0),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                              setState(() {
                                selectedType = value!;
                              });
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
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                  'Мастер сразу рассчитает и укажет стоимость работ при отклике на заказ, всего за 100 ₽ '),
                              Row(
                                children: [
                                  Checkbox(
                                      value: offerCheckbox,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          offerCheckbox = !value!;
                                        });
                                      }),
                                  Text('Мастера видят предложенные цены')
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlockWrapper(
                  padding: EdgeInsets.all(8.0),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                              setState(() {
                                selectedType = value!;
                              });
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
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'О стоимости работ вы договоритесь с мастером, когда выберите его кандидатом в исполнители'),
                              SizedBox(
                                height: 8,
                              ),
                              Text('Желаемая цена за услугу'),
                              TextField(
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.tertiary)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.tertiary))))
                            ],
                          ),
                        ),
                      )
                  ])),
            ),
            SizedBox(
              height: 35.0,
            ),
            FilledButton(
                style: ButtonStyle(
                    maximumSize: WidgetStatePropertyAll(Size(223.0, 56.0)),
                    minimumSize: WidgetStatePropertyAll(Size(223.0, 56.0)),
                    backgroundColor: WidgetStatePropertyAll(
                      theme.colorScheme.primary,
                    )),
                onPressed: () {},
                child: Text('Опубликовать заказ'))
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (returnedImage == null) return;
    setState(() {
      _selectedImages.add(File(returnedImage.path));
    });
  }
}
