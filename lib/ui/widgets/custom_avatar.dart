import 'package:flutter/material.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar(
      {super.key, this.radius = 40.0, this.networkImg, this.localImg});

  final double? radius;
  final String? networkImg;
  final String? localImg;

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {

  ImageProvider<Object> selectImage() {
    if (widget.localImg != null) {
      return AssetImage(widget.localImg!);
    } else if (widget.networkImg != null) {
      return NetworkImage(widget.networkImg!);
    } else {
      return AssetImage('assets/categories/1.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0),
      child: CircleAvatar(
        radius: widget.radius,
        backgroundColor: Colors.grey.shade100,
        backgroundImage: selectImage(),

      ),
    );
  }
}
