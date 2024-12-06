import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/bloc/userBloc/bloc/user_bloc.dart';
import 'package:ia_ma/features/publication/bloc/publication_bloc.dart';
import 'package:ia_ma/features/publication/widgets/widgets.dart';
import 'package:ia_ma/helpers/date_parser.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key, required this.id});

  final int id;

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final mapModalControllerCompleter = Completer<YandexMapController>();

  List<Category> categories = [];
  int? userId;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PublicationBloc>(context)
        .add(GetPublicationById(id: widget.id));

    _moveToCurrentLocation();

    BlocProvider.of<CategoriesBloc>(context).add(GetAllCategories());
    BlocProvider.of<UserBloc>(context).add(GetMe());
  }

  void _orderReply() {
    BlocProvider.of<PublicationBloc>(context).add(CreatePublicationResponse(
      id: widget.id,
    ));
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String setCategoryName(id) {
      if (categories.isNotEmpty) {
        var name = categories.firstWhere((el) => el.id == id).name;
        return name;
      }

      return 'empty';
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<CategoriesBloc, CategoriesBlocState>(
          listener: (context, state) {
            if (state is CategoriesLoaded) {
              setState(() {
                categories = state.categories.data;
              });
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserStateLoaded) {
              setState(() {
                userId = state.myUser.data.id;
              });
            }
          },
        ),
        BlocListener<PublicationBloc, PublicationBlocState>(
            listener: (context, state) {
          if (state is PublicationBlocStateLoaded) {
            if (userId == state.publication.data.userId) {
              BlocProvider.of<PublicationBloc>(context)
                  .add(GetReplies(id: widget.id));
            }
          }
        }
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          title: Text('Заказ'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/square-2-stack-icon.svg',
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/elipsis-horizontal.svg',
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ))
          ],
        ),
        body: BlocBuilder<PublicationBloc, PublicationBlocState>(
          builder: (context, state) {
            if (state is PublicationBlocStateLoaded) {
              final publication = state.publication.data;
              return Stack(children: [
                ListView(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: theme.cardTheme.color,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(24.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                CustomAvatar(
                                  radius: 24.0,
                                  localImg:
                                      'assets/categories/category_${publication.categoryId}.png',
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/date-icon.svg'),
                                            SizedBox(width: 4.0),
                                            Text(
                                              '${parseDate(publication.workBeginDate)} ${publication.workEndDate != null ? '-' : ""} ${publication.workEndDate != null ? parseDate(publication.workEndDate) : ""}',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey),
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
                                                  fontSize: 14.0,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      setCategoryName(publication.categoryId),
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: [
                                  if (publication.state == 1)
                                    CustomChip(
                                      fontSize: 14.0,
                                      bgColor:
                                          theme.colorScheme.secondaryFixedDim,
                                      textColor: theme.colorScheme.secondary,
                                      text: 'В поиске исполнителя',
                                      avatar: SvgPicture.asset(
                                          'assets/icons/magnifying-glass-icon.svg'),
                                    ),
                                  if (publication.state == 2)
                                    CustomChip(
                                      fontSize: 14.0,
                                      bgColor:
                                          theme.colorScheme.secondaryFixedDim,
                                      textColor:
                                          theme.colorScheme.primaryFixedDim,
                                      text: 'Выполняется',
                                      avatar: SvgPicture.asset(
                                          'assets/icons/lightning-icon.svg'),
                                    ),

                                  CustomChip(
                                    text:
                                        'закрытие ${publication.workEndDate != null ? parseDate(publication.workEndDate) : ""}',
                                    avatar: SvgPicture.asset(
                                      'assets/icons/clock-icon.svg',
                                      width: 14.0,
                                      height: 14.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(publication.title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 12.0),
                            PublicationImageCarousel(
                              images: publication.images!,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              publication.description!,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Container(
                              clipBehavior: Clip.hardEdge,
                              constraints: BoxConstraints.loose(
                                  Size(double.infinity, 100.0)),
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          theme.colorScheme.secondaryFixedDim,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(24.0)),
                              child: YandexMap(
                                onMapTap: (_) {
                                  showModalMapPublicationBottomSheet(context);
                                },
                                onMapCreated: (controller) async {
                                  mapControllerCompleter.complete(controller);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/location-mark.svg'),
                                SizedBox(width: 8.0),
                                Expanded(child: Text(publication.address!))
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color,
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                      child: OrderDetailedTypeIndicator(
                          isTender: publication.isTender,
                          startPrice: publication.startPrice ?? '',
                          price: publication.price),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    if (userId == publication.userId)
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                'Пока никто не откликнулся',
                                style: theme.textTheme.titleLarge,
                              ),
                              SizedBox(
                                height: 24.0,
                              ),
                              SvgPicture.asset('assets/icons/empty-page.svg'),
                            ],
                          )),
                    SizedBox(
                      height: 120.0,
                    )
                  ],
                ),
                if (userId != publication.executorId)
                  PublicationButtons(
                      orderReply: _orderReply,
                      userId: userId,
                      publicationUserId: publication.userId),
                if (userId == publication.executorId)
                  Text('Вы уже откликнулись')
              ]);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<void> showModalMapPublicationBottomSheet(BuildContext context) {
    final theme = Theme.of(context);

    return showModalBottomSheet<void>(
      enableDrag: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 5.0, bottom: 16.0),
              decoration: BoxDecoration(
                color: theme.cardTheme.color,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      Navigator.of(context).pop();
                    },
                    // onTap: () => Navigator.of(context).pop(),
                    child: BottomSheetDragMark(),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Адрес заказа',
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('Липецк, ул. Циолковского, 46'),
                  SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                      child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: const YandexMap(),
                  ))
                ],
              ),
            ));
      },
    );
  }

  /// Проверка разрешений на доступ к геопозиции пользователя

  Future<void> _moveToCurrentLocation() async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: 52.608826,
            longitude: 39.599229,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}

