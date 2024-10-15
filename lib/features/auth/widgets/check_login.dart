import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/features/auth/view/auth_otp_screen.dart';
import 'package:ia_ma/features/auth/widgets/widgets.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});



  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  bool _authTypesVisible = false;

  void showAuthTypes() {
    setState(() {
      _authTypesVisible = !_authTypesVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView(
          children: [
            SvgPicture.asset('assets/logo/logo.svg'),
            SizedBox(
              height: 28,
            ),
            Text(
              'Вход и регистрация',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Jost',
              ),
            ),
            SizedBox(
              height: 24,
            ),
            AuthTabSwitcher(),
            SizedBox(
              height: 32,
            ),
            CustomButton(
              text: 'Вход',
              radius: 24,
              height: 48,
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) => AuthOtpCheck());
                Navigator.push(context, route);
              },
            ),
            SizedBox(
              height: 12,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
                  text: 'Продолжая, вы соглашаетесь с',
                  children: [
                    TextSpan(
                        text: ' Политикой конфиденциальности',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                            color: Theme.of(context).primaryColor)),
                    TextSpan(
                      text: ' и ',
                    ),
                    TextSpan(
                        text: 'условиями использования',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                            color: Theme.of(context).primaryColor))
                  ]),
            ),
            SizedBox(
              height: 32,
            ),
            Center(
              child: Text(
                'Или через',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 12,),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                AuthTypes(icon: SvgPicture.asset('assets/icons/google.svg'), color: Colors.red),
                AuthTypes(icon: SvgPicture.asset('assets/icons/vk.svg'), color: Colors.blue),
                AuthTypes(
                    icon: SvgPicture.asset('assets/icons/yandex.svg'),
                    color: Colors.red),
                AuthTypes(icon: SvgPicture.asset('assets/icons/apple.svg'), color: Colors.grey),
                GestureDetector(
                  onTap: () {
                    showAuthTypes();
                  },
                  child: AuthTypes(
                      icon: SvgPicture.asset('assets/icons/chevron-down.svg'),
                      color: const Color.fromARGB(255, 236, 234, 234)),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            if (_authTypesVisible)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/gosuslugi.svg'),
                      color: const Color.fromARGB(255, 239, 238, 238)),
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/mail.svg'),
                      color: Colors.blue),
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/ok.svg'),
                      color: Colors.orange),
                ],
              )
          ],
        ),
      ),
    );
  }
}

