import 'package:auto_route/auto_route.dart';
import 'package:template/base/routers/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MainPageWrapper extends StatefulWidget {
  const MainPageWrapper({super.key});

  @override
  State<MainPageWrapper> createState() => _MainPageWrapperState();
}

class _MainPageWrapperState extends State<MainPageWrapper> {
  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
    // return MultiProvider(
    //   builder: (context, child) => const AutoRouter(),
    //   providers: [],
    // );
  }
}
