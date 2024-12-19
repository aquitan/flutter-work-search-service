import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_ma/bloc/myUserBloc/bloc/my_user_bloc.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class ProfilePersonalDataScreen extends StatefulWidget {
  const ProfilePersonalDataScreen({super.key});

  @override
  State<ProfilePersonalDataScreen> createState() =>
      _ProfilePersonalDataScreenState();
}

class _ProfilePersonalDataScreenState extends State<ProfilePersonalDataScreen> {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyUserBloc>(context).add(GetMe());
  }

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  final List<Map<String, dynamic>> socialConnectList = [
    {'icon': 'assets/icons/vk.svg', 'name': 'Вконтакте'},
    {'icon': 'assets/icons/google.svg', 'name': 'Google'},
    {'icon': 'assets/icons/ok.svg', 'name': 'Одноклассники'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.cardTheme.color,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text(
            'Личные данные',
            style: theme.textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MyUserBloc, MyUserState>(
          builder: (context, state) {
            if (state is UserStateLoaded) {
              final user = state.myUser.data;
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: ListView(children: <Widget>[
                  Text(
                    'Для начала работы заполните информацию о себе',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.colorScheme.tertiary),
                  ),
                  SizedBox(height: 12.0),
                  // Main Avatar ///////////
                  ProfilePersonalAvatar(
                    user: user,
                  ),

                  ///
                  SizedBox(height: 24.0),
                  // Personal Data Fields bloc /////////////
                  Text(
                    'Личные данные',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Укажите ваши реальные фамилию и имя, как в паспорте. Исправьте, если при регистрации указали неверно.',
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  // Text Fields Container
                  ProfilePersonlaNames(
                    user: user,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    middleNameController: middleNameController,
                  ),
                  SizedBox(height: 24.0),

                  // Phone/ Email Container
                  Text('Контактные данные', style: theme.textTheme.titleMedium),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Personal Contacts Fields
                  ProfilePersonalContacts(
                    user: user,
                    phoneController: phoneController,
                    emailController: emailController,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),

                  // Chose City ///////////////////////
                  Text('Укажите ваш город или населённый пункт',
                      style: theme.textTheme.titleMedium),
                  SizedBox(
                    height: 12.0,
                  ),
                  AutocompleteTextfield(options: _kOptions),
                  SizedBox(
                    height: 24.0,
                  ),

                  // Social Networks ///////////////////////
                  Text(
                    'Привязать соцсети',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Через соц. сети вы сможете входить в профиль, а также, получать важные уведомления о сообщениях, статусе заказа, аукционе и другие.',
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  SocialConnectList(
                    connectList: socialConnectList,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CustomButton(
                      onTap: () {},
                      text: 'Сохранить',
                      radius: 56.0,
                      height: 56.0),
                  SizedBox(
                    height: 18.0,
                  )
                ]),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
