import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/iama_app.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I<Talker>().debug('Talker started...');

  runApp(const IamaApp());
}

