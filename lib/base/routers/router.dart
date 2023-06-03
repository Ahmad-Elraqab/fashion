// For every changes made in router, run the below command:
// `flutter pub run build_runner build --delete-conflicting-outputs`

import 'package:auto_route/auto_route.dart';
import 'package:template/presentation/main/main_page.dart';
import 'package:template/presentation/main/main_page_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(
      page: MainPageWrapper,
      name: 'MainPageRouter',
      initial: true,
      path: '/',
      children: [
        MaterialRoute(page: MainPage, path: ''),
      ],
    ),
  ],
)
class $Router {}
