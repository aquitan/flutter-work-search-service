import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/bloc/publicationReplies/bloc/replies_bloc.dart';
import 'package:ia_ma/bloc/userBloc/bloc/user_bloc.dart';
import 'package:ia_ma/features/publication/bloc/publication_bloc.dart';
import 'package:ia_ma/features/publication/methods/show_modal_bottomsheet.dart';
import 'package:ia_ma/features/publication/widgets/widgets.dart';
import 'package:ia_ma/helpers/date_parser.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class PublicationScreen extends StatefulWidget {
  const PublicationScreen(
      {super.key, required this.id, required this.publicationUserId});

  final int id;
  final int publicationUserId;

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
    BlocProvider.of<UserBloc>(context).add(GetMe());



    BlocProvider.of<CategoriesBloc>(context).add(GetAllCategories());
    BlocProvider.of<PublicationBloc>(context)
        .add(GetPublicationById(id: widget.id));

    moveToCurrentLocation(mapControllerCompleter);
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

      return '';
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
              if (state.myUser.data.id == widget.publicationUserId) {
                BlocProvider.of<RepliesBloc>(context)
                    .add(GetReplies(id: widget.id));
              }
            }

          },
        ),
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
          body: PopScope(
            onPopInvokedWithResult: (didPop, result) {
              BlocProvider.of<RepliesBloc>(context).add(ClearState());
            },
            child: Stack(children: [
              ListView(
                children: [
                  BlocBuilder<PublicationBloc, PublicationBlocState>(
                    builder: (context, state) {
                      if (state is PublicationBlocStateLoaded) {
                        final publication = state.publication.data;
                        return Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          setCategoryName(
                                              publication.categoryId),
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
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      if (publication.state == 1)
                                        CustomChip(
                                          fontSize: 14.0,
                                          bgColor: theme
                                              .colorScheme.secondaryFixedDim,
                                          textColor:
                                              theme.colorScheme.secondary,
                                          text: 'В поиске исполнителя',
                                          avatar: SvgPicture.asset(
                                              'assets/icons/magnifying-glass-icon.svg'),
                                        ),
                                      if (publication.state == 2)
                                        CustomChip(
                                          fontSize: 14.0,
                                          bgColor: theme
                                              .colorScheme.secondaryFixedDim,
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
                                if (publication.images!.isNotEmpty)
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
                                          color: theme
                                              .colorScheme.secondaryFixedDim,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(24.0)),
                                  child: YandexMap(
                                    onMapTap: (_) {
                                      showModalMapPublicationBottomSheet(
                                          context);
                                    },
                                    onMapCreated: (controller) async {
                                      mapControllerCompleter
                                          .complete(controller);
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
                            ));
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  BlocBuilder<PublicationBloc, PublicationBlocState>(
                      builder: (context, state) {
                    if (state is PublicationBlocStateLoaded) {
                      final publication = state.publication.data;

                      return Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: theme.cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        ),
                        child: OrderDetailedTypeIndicator(
                            isTender: publication.isTender,
                            startPrice: publication.startPrice ?? '',
                            price: publication.price),
                      );
                    }
                    return SizedBox();
                  }),
                  SizedBox(
                    height: 24.0,
                  ),
                  BlocBuilder<RepliesBloc, RepliesState>(
                    builder: (context, state) {
                      if (state is RepliesStateLoaded) {
                        final replies = state.replies;
                        if (replies.count > 0) {
                          return PublicationReplies(
                            publicationId: widget.id,
                            userId: userId,
                            publicationUserId: widget.publicationUserId,
                            replies: replies,
                          );
                        } else {
                          return EmptyRepliesBlock();
                        }
                      }
                      return Container();
                    },
                  ),
                  SizedBox(
                    height: 120.0,
                  )
                ],
              ),
              BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                if (state is UserStateLoaded) {
                  final id = state.myUser.data.id;
                  return PublicationButtons(
                      orderReply: _orderReply,
                      userId: id,
                      publicationUserId: widget.publicationUserId);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })


            ]),
          )
      ),
    );
  }
}

