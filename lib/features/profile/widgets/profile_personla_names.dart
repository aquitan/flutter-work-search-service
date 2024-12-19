import 'package:flutter/material.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ProfilePersonlaNames extends StatelessWidget {
  const ProfilePersonlaNames(
      {super.key,
      required this.user,
      required this.firstNameController,
      required this.lastNameController,
      required this.middleNameController});

  final UserModel user;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController middleNameController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryFixedDim,
            borderRadius: BorderRadius.circular(24.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.0,
              children: [
                Text('Фамилия', style: theme.textTheme.bodyMedium),
                CustomTextfieldBordered(
                  controller: lastNameController,
                  filled: true,
                  label: user.lastName ?? 'Фамилия',
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.0,
              children: [
                Text('Имя', style: theme.textTheme.bodyMedium),
                CustomTextfieldBordered(
                  controller: firstNameController,
                  filled: true,
                  label: user.firstName ?? 'Имя',
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.0,
              children: [
                Text('Отчество', style: theme.textTheme.bodyMedium),
                CustomTextfieldBordered(
                  controller: middleNameController,
                  filled: true,
                  label: user.middleName ?? 'Отчество',
                ),
              ],
            )
          ],
        ));
  }
}
