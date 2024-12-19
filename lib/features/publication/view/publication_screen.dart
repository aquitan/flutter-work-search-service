import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/bloc/myUserBloc/bloc/my_user_bloc.dart';
import 'package:ia_ma/bloc/publicationReplies/bloc/replies_bloc.dart';
import 'package:ia_ma/features/profile/bloc/profile_bloc.dart';
import 'package:ia_ma/features/publication/bloc/publication_bloc.dart';
import 'package:ia_ma/features/publication/methods/show_modal_bottomsheet.dart';
import 'package:ia_ma/features/publication/widgets/widgets.dart';
import 'package:ia_ma/helpers/date_parser.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/router/router.dart';
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
    BlocProvider.of<MyUserBloc>(context).add(GetMe());

    BlocProvider.of<ProfileBloc>(context)
        .add(GetUserById(id: widget.publicationUserId));

    BlocProvider.of<RepliesBloc>(context).add(GetMyReply(id: widget.id));

    BlocProvider.of<CategoriesBloc>(context).add(GetAllCategories());
    BlocProvider.of<PublicationBloc>(context)
        .add(GetPublicationById(id: widget.id));

    moveToCurrentLocation(mapControllerCompleter);
  }

  void _orderReply() {
    final pBloc = context.read<PublicationBloc>().state;

    if (pBloc is PublicationBlocStateLoaded) {
      if (pBloc.publication.data.isTender == 'price_offer') {
        showOrderEvaluationBottomsheet(context);
      } else {
        BlocProvider.of<PublicationBloc>(context).add(CreatePublicationResponse(
          id: widget.id,
        ));
      }
    }
  }

  Future<dynamic> showOrderEvaluationBottomsheet(BuildContext context) {
    final theme = Theme.of(context);
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 24.0, left: 16.0, right: 16.0, bottom: 30.0),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8.0,
                      children: [
                        CustomSvgImage(
                            assetName: 'assets/icons/calculator-icon.svg'),
                        Text(
                          "Встречное предложение",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: theme.colorScheme.tertiary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10.0),
                    // TextField for giving some Input

                    Text(
                      'Рассчитайте заказ',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomSvgImage(
                            assetName: 'assets/icons/ruble-icon.svg',
                            width: 8.0,
                            height: 8.0,
                          ),
                        ),
                        isDense: true,
                        label: Text(
                          'Укажите стоимость работ',
                          style: TextStyle(color: theme.colorScheme.tertiary),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                width: 1.0, color: theme.colorScheme.tertiary)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                width: 1.0, color: theme.colorScheme.tertiary)),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    //Button for adding items
                    FilledButton(
                        onPressed: () {
                          var data = {'price': 1000};
                          BlocProvider.of<PublicationBloc>(context).add(
                              CreatePublicationResponse(
                                  id: widget.id, data: data));
                        },
                        style: ButtonStyle(
                            maximumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 56.0)),
                            minimumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 56.0)),
                            backgroundColor: WidgetStateProperty.all(
                                theme.colorScheme.primary),
                            textStyle: WidgetStateProperty.all(
                                const TextStyle(fontSize: 18))),
                        child: Row(
                          spacing: 8.0,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvgImage(
                              assetName: 'assets/icons/lightning-icon.svg',
                            ),
                            Text("Подтвердить отклик"),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        });
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
        BlocListener<MyUserBloc, MyUserState>(
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
                icon: CustomSvgImage(
                  assetName: 'assets/icons/square-2-stack-icon.svg',

              ),
            ),
            IconButton(
                onPressed: () {},
                  icon: CustomSvgImage(
                    assetName: 'assets/icons/elipsis-horizontal.svg',
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
                                                CustomSvgImage(
                                                    assetName:
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
                                                CustomSvgImage(
                                                    assetName:
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
                                          avatar: CustomSvgImage(
                                              assetName:
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
                                          avatar: CustomSvgImage(
                                              assetName:
                                                  'assets/icons/lightning-icon.svg'),
                                        ),

                                      CustomChip(
                                        text:
                                            'закрытие ${publication.workEndDate != null ? parseDate(publication.workEndDate) : ""}',
                                        avatar: CustomSvgImage(
                                          assetName:
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
                                    CustomSvgImage(
                                        assetName:
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
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<PublicationBloc, PublicationBlocState>(
                            builder: (context, state) {
                          if (state is PublicationBlocStateLoaded) {
                            final publication = state.publication.data;

                            return OrderDetailedTypeIndicator(
                                isTender: publication.isTender,
                                startPrice: publication.startPrice ?? '',
                                price: publication.price);
                          }
                          return SizedBox();
                        }),
                        SizedBox(
                          height: 12.0,
                        ),
                        BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                          if (state is ProfileStateLoaded) {
                            final user = state.user;

                            return GestureDetector(
                              onTap: () => AutoRouter.of(context)
                                  .push(ProfileRoute(id: user.id)),
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    CustomAvatar(
                                      radius: 20.0,
                                      bordered: true,
                                      isOnline: true,
                                      initials:
                                          '${user.firstName![0]}${user.lastName?[0] ?? ''}',
                                      networkImg: user.avatar != null
                                          ? '${dotenv.env['YA_MA_CDN']}${user.avatar}'
                                          : null,
                                    ),
                                    SizedBox(width: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Заказчик',
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(
                                                  color: theme
                                                      .colorScheme.tertiary),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                '${user.firstName} ${user.lastName ?? ''}'),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Row(
                                              children: [
                                                CustomSvgImage(
                                                    assetName:
                                                        'assets/icons/filled-star-icon.svg'),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text('${user.rating}')
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        })
                      ],
                    ),
                  ),

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
              BlocBuilder<MyUserBloc, MyUserState>(builder: (context, state) {
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

