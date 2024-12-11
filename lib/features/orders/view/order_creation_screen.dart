import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/features/orders/bloc/orders_bloc.dart';
import 'package:ia_ma/features/orders/widgets/widgets.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:ia_ma/router/router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class OrderCreationScreen extends StatefulWidget {
  const OrderCreationScreen({super.key});

  @override
  State<OrderCreationScreen> createState() => _OrderCreationScreenState();
}

class _OrderCreationScreenState extends State<OrderCreationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController regularOrderTextFieldController =
      TextEditingController();

  final List<File> _selectedImages = [];
  final List<String> typeValues = ['regular', 'auction', 'offer'];

  String selectedType = 'regular';
  bool offerCheckbox = true;
  String? dateStart;
  String? dateEnd;
  int? selectedCategorie;

  @override
  void initState() {
    BlocProvider.of<CategoriesBloc>(context).add(GetAllCategories());
    super.initState();
  }

  removeSelectedImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void createOrder() {
    var newOrder = {
      'address': addressController.text,
      'address_lat': '55.755864',
      'address_lon': '37.617698',
      'address_point': ['55.755864', '37.617698'],
      'category_id': selectedCategorie,
      'description': descriptionController.text,
      'is_tender': null,
      'price': int.parse(regularOrderTextFieldController.text),
      'show_other_responses': false,
      'step_type': 'relative',
      'title': titleController.text,
      'type': selectedType,
      // 'images': _selectedImages,
      'work_begin_date': dateStart,
      'work_end_date': dateEnd
    };

    BlocProvider.of<OrdersBloc>(context)
        .add(CreateNewOrder(order: OrderCreationDto.fromJson(newOrder)));
  }

  void selectCategory(CategoriesModel categories, int i) {
    setState(() {
      if (selectedCategorie != categories.data[i].id) {
        selectedCategorie = categories.data[i].id;
      } else {
        selectedCategorie = null;
      }
    });
  }

  void setRadioValue(String value) {
    setState(() {
      selectedType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<OrdersBloc, OrdersBlocState>(
      listener: (context, state) {
        if (state is OrdersBlocStateCreated) {
          AutoRouter.of(context).push(OrdersRoute());
        }
      },
      child: Scaffold(
        backgroundColor: theme.cardColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text('Создание заказа'),
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesBlocState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              final categories = state.categories;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: ListView(
                    children: [
                      Text('Назовите объявление',
                          style: theme.textTheme.titleMedium),
                      SizedBox(
                        height: 12.0,
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text(
                              'Название объявления',
                              style:
                                  TextStyle(color: theme.colorScheme.tertiary),
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
                                    color: theme.colorScheme.tertiary))),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text('Выберите подходящую категорию',
                          style: theme.textTheme.titleMedium),
                      SizedBox(
                        height: 12.0,
                      ),
                      InitialCategoriesList(
                          categories: categories,
                          selectedCategorie: selectedCategorie,
                          selectCategory: selectCategory,
                          theme: theme),
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
                          onTap: () async {
                            DateTimeRange? datePickerDate =
                                await showDateRangePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2026));

                            setState(() {
                              dateStart = DateFormat('yyyy-MM-dd')
                                  .format(datePickerDate!.start.toLocal());
                              dateEnd = DateFormat('yyyy-MM-dd')
                                  .format(datePickerDate.end.toLocal());
                            });
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/calendar-icon.svg'),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(dateStart != null
                                  ? '$dateStart - $dateEnd'
                                  : 'Выберите дату'),
                            ],
                          )),
                      SizedBox(
                        height: 32.0,
                      ),
                      Text('Что нужно сделать?',
                          style: theme.textTheme.titleMedium),
                      SizedBox(
                        height: 12.0,
                      ),
                      TextField(
                          controller: descriptionController,
                          minLines: 3,
                          maxLines: 20,
                          decoration: InputDecoration(
                              isDense: true,
                              label: Text(
                                'Опишите подробно, что нужно сделать',
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
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
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
                                          .copyWith(
                                              color:
                                                  theme.colorScheme.tertiary)),
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
                              child: AddPhotoBigArea(),
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
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        width: 80.0,
                                        height: 100.0,
                                        child: Image.file(
                                          _selectedImages[i],
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: GestureDetector(
                                          // onTap: () {
                                          //   removeSelectedImage(i);
                                          // },
                                          child: Container(
                                        decoration: BoxDecoration(
                                          color: theme
                                              .colorScheme.tertiaryFixedDim,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
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
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      child: GestureDetector(
                                        onTap: () => _pickImageFromGallery(),
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
                        controller: addressController,
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text(
                              'Адрес или район заказа',
                              style:
                                  TextStyle(color: theme.colorScheme.tertiary),
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
                                    color: theme.colorScheme.tertiary))),
                      ),
                      SizedBox(height: 32.0),
                      // OrderTypeSelectionBlocks
                      OrderTypeSelectionBlocks(
                          setRadioValue: setRadioValue,
                          selectedType: selectedType,
                          offerCheckbox: offerCheckbox,
                          regularOrderTextFieldController:
                              regularOrderTextFieldController),
                      SizedBox(
                        height: 35.0,
                      ),
                      FilledButton(
                          style: ButtonStyle(
                              maximumSize:
                                  WidgetStatePropertyAll(Size(223.0, 56.0)),
                              minimumSize:
                                  WidgetStatePropertyAll(Size(223.0, 56.0)),
                              backgroundColor: WidgetStatePropertyAll(
                                theme.colorScheme.primary,
                              )),
                          onPressed: () {
                            createOrder();
                          },
                          child: Text(
                            'Опубликовать заказ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
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
      GetIt.I<Talker>().debug({
        'filename': returnedImage.name,
        'mimetype': returnedImage.mimeType,
      });
      _selectedImages.add(File(returnedImage.path));
    });
  }
}
