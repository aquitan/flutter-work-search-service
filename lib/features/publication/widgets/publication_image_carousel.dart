import 'package:flutter/material.dart';

class PublicationImageCarousel extends StatelessWidget {
  const PublicationImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 108,
      child: CarouselView(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          itemExtent: 88,
          children: List.generate(8, (int index) {
            return ColoredBox(
                color: theme.colorScheme.secondaryFixedDim,
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://otvet.imgsmail.ru/download/287836_88195aec6441674311982056978bfcfb_800.jpg'));
          })),
    );
  }
}
