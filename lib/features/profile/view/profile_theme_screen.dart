import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_ma/bloc/cubit/theme_cubit.dart';

@RoutePage()
class ProfileThemeScreen extends StatefulWidget {
  const ProfileThemeScreen({super.key});

  @override
  State<ProfileThemeScreen> createState() => _ProfileThemeScreenState();
}

class _ProfileThemeScreenState extends State<ProfileThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    Brightness? selectedOption =
        isDarkTheme ? Brightness.dark : Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Text('Цветовая тема'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 210.0,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryFixedDim,
            border: Border.all(
              width: 1.0,
              color: theme.colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Системная',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Radio(
                      value: Brightness.dark,
                      groupValue: selectedOption,
                      onChanged: (Brightness? value) {
                        context
                            .read<ThemeCubit>()
                            .setThemeBrightness(Brightness.dark);
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Светлая',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Radio(
                      value: Brightness.light,
                      groupValue: selectedOption,
                      onChanged: (Brightness? value) {
                        context
                            .read<ThemeCubit>()
                            .setThemeBrightness(Brightness.light);
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Тёмная',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Radio(
                      value: Brightness.dark,
                      groupValue: selectedOption,
                      onChanged: (Brightness? value) {
                        context
                            .read<ThemeCubit>()
                            .setThemeBrightness(Brightness.dark);
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
