import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

Future<void> showModalMapPublicationBottomSheet(BuildContext context) {
  final theme = Theme.of(context);

  return showModalBottomSheet<void>(
    enableDrag: false,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    builder: (BuildContext context) {
      return Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 5.0, bottom: 16.0),
            decoration: BoxDecoration(
              color: theme.cardTheme.color,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.0),
              ),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    Navigator.of(context).pop();
                  },
                  // onTap: () => Navigator.of(context).pop(),
                  child: BottomSheetDragMark(),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Адрес заказа',
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text('Липецк, ул. Циолковского, 46'),
                SizedBox(
                  height: 16.0,
                ),
                Expanded(
                    child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(24)),
                  child: const YandexMap(),
                ))
              ],
            ),
          ));
    },
  );
}

/// Проверка разрешений на доступ к геопозиции пользователя

Future<void> moveToCurrentLocation(dynamic mapControllerCompleter) async {
  (await mapControllerCompleter.future).moveCamera(
    animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
    CameraUpdate.newCameraPosition(
      CameraPosition(
        target: Point(
          latitude: 52.608826,
          longitude: 39.599229,
        ),
        zoom: 12,
      ),
    ),
  );
}
