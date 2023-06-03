import 'package:flutter/material.dart';
import 'package:template/base/app/config/environment_config.dart';
import 'package:template/base/di/app_dependencies.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../routers/router.gr.dart' as router;

class App extends StatelessWidget {
  App({super.key, required this.env});
  final EnvironmentConfig env;
  final _router = router.Router();

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: AppDependencies.of(context, env).providers,
    //   child: _MaterialApp(_router),
    // );
    return _MaterialApp(_router);
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp(this._router);

  final router.Router _router;

  @override
  State<_MaterialApp> createState() => __MaterialAppState();
}

class __MaterialAppState extends State<_MaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, _) => ResponsiveWrapper.builder(
        MaterialApp.router(
          title: 'App',
          routeInformationParser: widget._router.defaultRouteParser(),
          routerDelegate: widget._router.delegate(
            navigatorObservers: () => [],
          ),
          debugShowCheckedModeBanner: false,
        ),
        maxWidth: 550,
        minWidth: 350,
        defaultScale: false,
        breakpoints: [
          // const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.resize(2460, name: '4K'),
        ],
      ),
    );
  }
}
