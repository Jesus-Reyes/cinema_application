

import 'package:go_router/go_router.dart';
import 'package:cinema_application/ui/movies/pages/index.dart';

final moviesRoutes = [
  GoRoute(
    path: '/movie/:id',
    name: 'movies',
    builder: (context, state) => MoviePage(),
  ),
];