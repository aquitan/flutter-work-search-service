import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({
    super.key,
    required this.value,
    required this.type,
  });

  final String value;
  final String type;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;

  void onTap() {
    GetIt.I<Talker>().debug('Пароль сброшен и изменен на новый');
    BlocProvider.of<AuthBloc>(context).add(ResetPassword(
      value: widget.value,
      type: widget.type,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocStateReset) {
          AutoRouter.of(context).popUntilRoot();
        } else if (state is AuthBlocStateResetFailure) {
          GetIt.I<Talker>().debug(state);
        }
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            surfaceTintColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            foregroundColor: theme.scaffoldBackgroundColor,
            title: Logo(),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
            )),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              'Восстановление пароля',
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            RichText(
                text: TextSpan(
                    style: theme.textTheme.bodyMedium,
                    text: 'Введите новый пароль \n',
                    children: [TextSpan(text: widget.value)])),
            SizedBox(
              height: 12,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: obscureText
                            ? SvgPicture.asset('assets/icons/eye-icon.svg')
                            : SvgPicture.asset('assets/icons/eye-closed.svg'),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.dividerColor)),
                      labelText: 'Пароль'),
                  obscureText: obscureText,
                ),
              ],
            )),
            SizedBox(
              height: 24,
            ),
            CustomButton(
              onTap: () => onTap(),
              text: 'Восстановить',
              radius: 24,
              height: 48,
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
