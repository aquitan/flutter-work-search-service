import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({super.key});

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 12.0,
        children: [
          // BlogCard Header ///////////////////
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(BlogUserRoute(userId: 2));
                },
                child: Row(
                  spacing: 8.0,
                  children: [
                    CustomAvatar(
                      radius: 20.0,
                      initials: 'UG',
                    ),
                    Text('Uniloye Govno'),
                    CustomSvgImage(
                      assetName: 'assets/icons/virified-icon.svg',
                      color: successColor,
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: CustomSvgImage(
                    assetName: 'assets/icons/elipsis-horizontal.svg',
                  )),
            ],
          ),

          // BlogCard Categories ///////////////////
          //
          Wrap(spacing: 4.0, children: [
            CustomChip(
              text: 'Дизайнерские решения',
              padding: 0.0,
              bgColor: theme.colorScheme.tertiaryFixedDim,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ]),

          Container(
            clipBehavior: Clip.hardEdge,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
            child: Image(
                image: NetworkImage(
                    '${dotenv.env['YA_MA_CDN']}72856e281683ef48b072fb05648214da.jpeg')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 8.0,
                  children: [
                    Row(
                      spacing: 4.0,
                      children: [
                        CustomSvgImage(
                            assetName: 'assets/icons/heart-icon.svg'),
                        Text(
                          '62',
                          style: theme.textTheme.bodySmall,
                        )
                      ],
                    ),
                    Row(
                      spacing: 4.0,
                      children: [
                        CustomSvgImage(
                            assetName: 'assets/icons/bookmark-icon.svg'),
                        Text(
                          '4',
                          style: theme.textTheme.bodySmall,
                        )
                      ],
                    ),
                    CustomSvgImage(
                        assetName: 'assets/icons/arrow-up-on-square.svg'),
                  ],
                ),
                Row(
                  spacing: 4.0,
                  children: [
                    CustomSvgImage(assetName: 'assets/icons/eye-icon.svg'),
                    Text(
                      '356',
                      style: theme.textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          ),
          Text(
            'Ремонт под ключ в загородном доме у моря',
            style: theme.textTheme.titleSmall,
          ),
          Text(
            'Сроки, которые мы укажем в этой статье максимальны с учётом привлечения к работам специалистов при совокупности благоприятных событий. Первым делом необходимо сделать проект. Проект не обязательно делать с 3Д визуализацией, но он должен содержать следующие элементы.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
          Text(
            'опубликовано в 10:35',
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.tertiary),
          )
        ],
      ),
    );
  }
}
