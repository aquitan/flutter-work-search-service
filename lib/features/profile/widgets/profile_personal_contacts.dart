import 'package:flutter/material.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ProfilePersonalContacts extends StatelessWidget {
  const ProfilePersonalContacts(
      {super.key,
      required this.user,
      required this.phoneController,
      required this.emailController});

  final UserModel user;
  final TextEditingController phoneController;
  final TextEditingController emailController;

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
        spacing: 12.0,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              Text('Номер телефона', style: theme.textTheme.bodyMedium),
              CustomTextfieldBordered(
                readOnly: true,
                controller: phoneController,
                filled: true,
                label: user.phone ?? 'Номер телефона',
                suffixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomSvgImage(
                      assetName: 'assets/icons/pencil-square-icon.svg',
                      height: 20.0,
                      width: 20.0,
                    )),
                prefixIcon: user.phone != null
                    ? Icon(Icons.check_circle, color: successColor, size: 20.0)
                    : null,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              Text('Email', style: theme.textTheme.bodyMedium),
              CustomTextfieldBordered(
                controller: emailController,
                filled: true,
                label: user.email ?? 'Email',
                suffixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomSvgImage(
                      assetName: 'assets/icons/pencil-square-icon.svg',
                      height: 20.0,
                      width: 20.0,
                    )),
                prefixIcon: user.email != null
                    ? Icon(Icons.check_circle, color: successColor, size: 20.0)
                    : null,
              ),
            ],
          )
        ],
      ),
    );
  }
}
