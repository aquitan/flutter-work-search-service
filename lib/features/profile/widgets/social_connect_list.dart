import 'package:flutter/material.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';

class SocialConnectList extends StatelessWidget {
  const SocialConnectList({super.key, required this.connectList});

  final List<Map<String, dynamic>> connectList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 158.0,
      height: 172.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SocialConnectBloc(
                icon: connectList[index]['icon'],
                name: connectList[index]['name']);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: connectList.length),
    );
  }
}
