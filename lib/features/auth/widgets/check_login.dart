import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/features/auth/view/auth_otp_check.dart';
import 'package:ia_ma/features/auth/widgets/widgets.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({super.key});

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
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) => AuthOtpCheck());
                Navigator.push(context, route);
              },
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Продолжая, вы соглашаетесь с Политикой конфиденциальности и условиями использования',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
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
                AuthTypes(icon: SvgPicture.asset('assets/icons/yandex.svg'), color: Colors.orange),
                AuthTypes(icon: SvgPicture.asset('assets/icons/apple.svg'), color: Colors.grey),
              ],
            )
          ],
        ),
      ),
    );
  }
}

