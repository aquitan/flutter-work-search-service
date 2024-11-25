import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar(
      {super.key,
      this.radius = 40.0,
      this.networkImg,
      this.localImg,
      this.isOnline = false,
      this.bordered = false});

  final double? radius;
  final String? networkImg;
  final String? localImg;
  final bool? bordered;
  final bool? isOnline;

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
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor:
          widget.isOnline! ? successColor : theme.colorScheme.tertiary,
      child: CircleAvatar(
        radius: widget.bordered! ? widget.radius! - (2.0) : widget.radius,
        backgroundColor: Colors.grey.shade100,
        backgroundImage: selectImage(),

      ),
    );
  }
}
