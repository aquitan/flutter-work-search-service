import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/features/publication/widgets/widgets.dart';
import 'package:ia_ma/ui/theme/theme.dart';

class PublicationButtons extends StatelessWidget {
  const PublicationButtons(
      {super.key,
      required this.userId,
      required this.publicationUserId,
      required this.orderReply});

  final int? userId;
  final int? publicationUserId;
  final Function orderReply;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(color: theme.cardTheme.color),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 30.0, left: 16.0, right: 16.0),
            child: PublicationResponseButton(
                orderReply: orderReply,
                userId: userId,
                publicationUserId: publicationUserId,
                showPublicationModalBottomSheet:
                    showPublicationModalBottomSheet)
        ),
      ),
    );
  }

  Future<void> showPublicationModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) {
        return PublicationQrModalBottomSheet();
      },
    );
  }
}

class PublicationResponseButton extends StatelessWidget {
  const PublicationResponseButton(
      {super.key,
      this.userId,
      this.publicationUserId,
      required this.showPublicationModalBottomSheet,
      required this.orderReply});

  final int? userId;
  final int? publicationUserId;
  final Function showPublicationModalBottomSheet;
  final Function orderReply;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print('$userId === $publicationUserId');
    if (userId == publicationUserId) {

      return FilledButton(
          style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size.fromHeight(56.0)),
              maximumSize: WidgetStatePropertyAll(Size.fromHeight(56.0)),
              backgroundColor: WidgetStatePropertyAll(
                primaryFlat,
              )),
          onPressed: () {
            showPublicationModalBottomSheet(context);
          },
          child: SizedBox(
            width: 300.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/qr-code-icon.svg'),
                SizedBox(width: 8),
                Text(
                  'Сгенерировать QR-код',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: primaryColor),
                )
              ],
            ),
          ));
    }

    return FilledButton(
        style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(56.0)),
            maximumSize: WidgetStatePropertyAll(Size.fromHeight(56.0)),
            backgroundColor: WidgetStatePropertyAll(
              theme.colorScheme.primary,
            )),
        onPressed: () {
          orderReply();
        },
        child: SizedBox(
          width: 300.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/lightning-icon.svg',
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              SizedBox(width: 8),
              Text(
                'Откликнуться на заказ',
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              )
            ],
          ),
        ));
  }
}
