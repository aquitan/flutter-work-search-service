import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/repository/publication/models/publication_models.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class PublicationReplyCard extends StatefulWidget {
  const PublicationReplyCard({super.key, required this.reply});

  final CandidateModel reply;

  @override
  State<PublicationReplyCard> createState() => _PublicationReplyCardState();
}

class _PublicationReplyCardState extends State<PublicationReplyCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlockWrapper(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomAvatar(
                  radius: 20,
                  networkImg:
                      '${dotenv.env['YA_MA_CDN']}${widget.reply.user.avatar}',
                  initials:
                      '${widget.reply.user.firstName![0]}${widget.reply.user.lastName?[0] ?? ''}',
                ),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/filled-star-icon.svg'),
                            SizedBox(
                              width: 4,
                            ),
                            Text(widget.reply.user.rating.toString())
                          ],
                        )),
                        SizedBox(width: 8.0),
                        SizedBox(
                            child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/recomendations-icon.svg'),
                            SizedBox(
                              width: 4,
                            ),
                            Text(widget.reply.user.rating.toString())
                          ],
                        )),
                        SizedBox(width: 8.0),
                        SizedBox(
                            child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/argues-icon.svg'),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${widget.reply.user.rating}')
                          ],
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.reply.user.firstName} ${widget.reply.user.lastName ?? ''}',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    )
                  ],
                )
              ]),
              OutlinedButton(
                  style: ButtonStyle(
                      side: WidgetStateProperty.all(
                    BorderSide(
                      color: theme.colorScheme.primary,
                      width: 2.0,
                    ),
                  )),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/icons/chat-bubble-oval-left-ellipsis.svg'),
                      SizedBox(width: 8.0),
                      Text('Обсудить заказ'),
                    ],
                  ))
            ],
          ),
        ));
  }
}
