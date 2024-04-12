import 'package:flutter_application_1/presentation/pages/login_page/login_page.dart';
import 'package:flutter_application_1/presentation/pages/main_page/main_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
  GoRoute(path: '/main',
    name: 'main',
    builder: (context, state) => MainPage(),
  ),
  GoRoute(path: '/login',
    name: 'login',
    builder: (context, state) => LoginPage(),
  )
], initialLocation: '/login', debugLogDiagnostics: false);