import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';

class PublicationImageCarousel extends StatelessWidget {
  const PublicationImageCarousel({
    super.key,
    required this.images,
  });

  final List<ImageModel> images;



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return SizedBox(
      height: 108,
      child: CarouselView(
          onTap: (index) {
            showSimpleModalDialog(context, index);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          itemExtent: 88,
          children: List.generate(images.length, (int index) {
            return ColoredBox(
              color: theme.colorScheme.secondaryFixedDim,
              child: Image.network(
                  fit: BoxFit.cover,
                  '${dotenv.env['YA_MA_CDN']}${images[index].fileName}'),
            );
          })),
    );
  }

  showSimpleModalDialog(context, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog.fullscreen(
            child: Container(
                padding: EdgeInsets.all(16.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
                child: Image.network(
                    fit: BoxFit.contain,
                    '${dotenv.env['YA_MA_CDN']}${images[index].fileName}')),
          );
        });
  }
}
