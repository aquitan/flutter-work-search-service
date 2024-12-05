import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpFieldCustom extends StatefulWidget {
  final dynamic onSubmit;

  const OtpFieldCustom({super.key, required this.onSubmit});

  @override
  State<OtpFieldCustom> createState() => _OtpFieldCustomState();
}

class _OtpFieldCustomState extends State<OtpFieldCustom> {

  _OtpFieldCustomState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OtpTextField(
      fillColor: Colors.grey.withOpacity(0.2),
      keyboardType: TextInputType.number,
      filled: true,
      numberOfFields: 4,
      borderColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(8),
      //set to true to show as box or false to show as dash
      fieldWidth: 80,
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      focusedBorderColor: theme.primaryColor,
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        widget.onSubmit(verificationCode);
      }, // end onSubmit
    );
  }
}
