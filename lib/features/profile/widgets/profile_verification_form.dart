import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ProfileVerificationForm extends StatelessWidget {
  const ProfileVerificationForm(
      {super.key,
      required this.passportSeriesController,
      required this.passportNumberController});

  final TextEditingController passportSeriesController;
  final TextEditingController passportNumberController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: theme.colorScheme.tertiaryFixedDim,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(width: 1, color: theme.colorScheme.tertiary)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 12.0,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.0,
              children: [
                Text('Серия паспорта', style: theme.textTheme.bodyMedium),
                CustomTextfieldBordered(
                    filled: true,
                    label: 'Введите серию паспорта',
                    hint: '00 00',
                    maxLength: 4,
                    controller: passportSeriesController)
              ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.0,
              children: [
                Text('Номер паспорта', style: theme.textTheme.bodyMedium),
                CustomTextfieldBordered(
                    filled: true,
                    label: 'Введите номер паспорта',
                    hint: '00 00 00',
                    maxLength: 6,
                    controller: passportNumberController)
              ]),
          Row(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSvgImage(
                assetName: 'assets/icons/lock-closed.svg',
                color: theme.colorScheme.secondary,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Это безопасно: мы не храним ваши персональные данные и не передаём третьим лицам. ',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                    Text(
                      'Политика Конфиденциальности',
                      style: theme.textTheme.bodySmall!.copyWith(
                          decoration: TextDecoration.underline,
                          color: theme.colorScheme.secondary),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
