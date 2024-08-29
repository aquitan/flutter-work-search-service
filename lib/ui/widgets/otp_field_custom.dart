import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpFieldCustom extends StatefulWidget {
  final dynamic onSubmit;

  OtpFieldCustom({super.key, required this.onSubmit});

  @override
  State<OtpFieldCustom> createState() => _OtpFieldCustomState(onSubmit: this.onSubmit);
}

class _OtpFieldCustomState extends State<OtpFieldCustom> {
  Function onSubmit;

  _OtpFieldCustomState({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OtpTextField(
      numberOfFields: 4,
      borderColor: Colors.orange,
      borderRadius: BorderRadius.circular(8),
      //set to true to show as box or false to show as dash
      fieldWidth: 80,
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
        print(code);
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        onSubmit(verificationCode);
      }, // end onSubmit
    );
  }
}
