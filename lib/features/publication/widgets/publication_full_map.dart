import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class PublicationFullMap extends StatefulWidget {
  const PublicationFullMap({super.key});

  @override
  State<PublicationFullMap> createState() => _PublicationFullMapState();
}

class _PublicationFullMapState extends State<PublicationFullMap> {
  final List<MapObject> mapObjects = [];

  final MapObjectId mapObjectId = const MapObjectId('normal_icon_placemark');
  final MapObjectId mapObjectWithDynamicIconId =
      const MapObjectId('dynamic_icon_placemark');
  final MapObjectId mapObjectWithCompositeIconId =
      const MapObjectId('composite_icon_placemark');

  Future<Uint8List> _rawPlacemarkImage() async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(50, 50);
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const radius = 20.0;

    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return YandexMap(mapObjects: mapObjects);
  }
}
