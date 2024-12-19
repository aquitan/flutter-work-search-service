import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class CoverLetterTab extends StatelessWidget {
  const CoverLetterTab(
      {super.key,
      required this.experienceController,
      required this.coverLetterController});

  final TextEditingController experienceController;
  final TextEditingController coverLetterController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Text(
          'Вы мастер? Умеете и хотите выполнять заказы по строительсву и ремонту?',
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.secondary),
        ),
        SizedBox(height: 24.0),
        Text('Составьте сопроводительное письмо для отклика на заказы',
            style: theme.textTheme.titleMedium),
        SizedBox(height: 12.0),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: theme.colorScheme.tertiary),
              color: theme.colorScheme.tertiaryFixedDim,
              borderRadius: BorderRadius.circular(24.0)),
          child: Column(
            children: [
              Text('Опыт работ по выбранным направлениям'),
              SizedBox(
                height: 8.0,
              ),
              CustomTextfieldBordered(
                  filled: true,
                  label: 'Опыт работ',
                  controller: experienceController),
              SizedBox(
                height: 12.0,
              ),
              Text('Универсальное приветственное письмо для отклика на заказ'),
              SizedBox(
                height: 8.0,
              ),
              CustomTextfieldBordered(
                  filled: true,
                  label: 'Напишите приветствие для отклика на заказ',
                  controller: coverLetterController),
            ],
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        CustomButton(
            onTap: () {}, text: 'Сохранить', radius: 56.0, height: 56.0)
      ],
    );
  }
}
