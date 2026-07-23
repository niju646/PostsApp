import 'package:flutter_app/core/router/modules/common_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [...commonRoutes],
);
