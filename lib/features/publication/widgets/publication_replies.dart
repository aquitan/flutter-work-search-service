import 'package:flutter/material.dart';
import 'package:ia_ma/repository/publication/models/publication_models.dart';
import 'package:ia_ma/ui/widgets/publication_reply_card.dart';

class PublicationReplies extends StatefulWidget {
  const PublicationReplies(
      {super.key,
      required this.userId,
      required this.publicationUserId,
      required this.publicationId,
      this.replies});

  final int? userId;
  final int? publicationUserId;
  final int publicationId;
  final CandidatesModel? replies;

  @override
  State<PublicationReplies> createState() => _PublicationRepliesState();
}

class _PublicationRepliesState extends State<PublicationReplies> {
  @override
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Откликнулись на заказ',
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(width: 8.0),
              Text(
                '4',
                style: theme.textTheme.titleLarge!
                    .copyWith(color: theme.colorScheme.secondary),
              )
            ],
          ),
        ),
        SizedBox(height: 16.0),
        SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.separated(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: widget.replies!.count,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return PublicationReplyCard(
                    reply: widget.replies!.data![index],
                  );
                })),
      ],
    );
  }
}
