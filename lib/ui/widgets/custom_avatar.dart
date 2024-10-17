import 'package:flutter/material.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar({super.key});

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(50),
      //   border: Border.all(color: Colors.grey.shade400, width: 2.0),
      // ),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        backgroundImage: NetworkImage(
            'https://i.pinimg.com/736x/8e/b8/f5/8eb8f553420dc9fd1d79647681a31447.jpg'),
      ),
    );
  }
}
