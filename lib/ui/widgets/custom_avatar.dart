import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar(
      {super.key,
      this.radius = 40.0,
      this.networkImg,
      this.localImg,
      this.isOnline = false,
      this.bordered = false,
      this.initials,
      this.svgImage});

  final double? radius;
  final String? networkImg;
  final String? localImg;
  final bool? bordered;
  final bool? isOnline;
  final String? initials;
  final String? svgImage;

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {



  selectImage() {
    if (widget.localImg != null) {
      return AssetImage(widget.localImg!);
    } else if (widget.networkImg != null) {
      return NetworkImage(widget.networkImg!);
    } else if (widget.svgImage != null) {
      return CustomSvgImage(assetName: widget.svgImage!);
    } else {
      return null;
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
        backgroundColor: theme.colorScheme.tertiaryFixedDim,
        backgroundImage: selectImage(),
        child: selectImage() != null
            ? null
            : Text(widget.initials!, style: theme.textTheme.bodySmall),

      ),
    );
  }
}
