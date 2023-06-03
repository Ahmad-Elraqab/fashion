import 'package:flutter/material.dart';
import 'package:template/base/app/app.dart';
import 'package:template/base/app/config/environment_config.dart';

void main(List<String> args) {
  runApp(
    App(env: EnvironmentConfig.staging),
  );
}
