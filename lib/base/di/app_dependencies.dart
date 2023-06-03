import 'package:flutter/material.dart';
import 'package:template/base/app/config/environment_config.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppDependencies {
  AppDependencies._({
    required this.context,
    required this.env,
  });

  final BuildContext context;
  final EnvironmentConfig env;

  static AppDependencies? _instance;

  factory AppDependencies.of(context, env) =>
      _instance ?? AppDependencies._(context: context, env: env);

  List<SingleChildWidget> get providers => [
        ..._analytics,
        ..._httpClients,
        ..._dataStorages,
        ..._dataSources,
        ..._repositories,
        ..._useCases,
        ..._providers,
        ..._interceptors,
      ];

  List<Provider> get _providers => [];
  List<Provider> get _analytics => [];
  List<Provider> get _httpClients => [];
  List<Provider> get _dataStorages => [];
  List<Provider> get _dataSources => [];
  List<Provider> get _repositories => [];
  List<Provider> get _useCases => [];
  List<Provider> get _interceptors => [];
}
