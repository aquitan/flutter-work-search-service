import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyOrdersScreenBanner extends StatelessWidget {
  const EmptyOrdersScreenBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/no-documents.svg'),
              SizedBox(
                height: 24.0,
              ),
              Text('У вас пока нет размещённых заказов '),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
