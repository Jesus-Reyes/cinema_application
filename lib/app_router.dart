import 'package:go_router/go_router.dart';

import 'package:cinema_application/ui/movies/movies_routes.dart';
import 'package:cinema_application/ui/movies/pages/movies_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => MoviesPage(),
      routes: [
        ...moviesRoutes
      ], 
    )
  ],
);
