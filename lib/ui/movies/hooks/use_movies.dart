import 'package:cinema_application/adapters/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UseMovies {
  final WidgetRef ref;

  UseMovies(this.ref);

  Future<void> loadMovies() async {

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();

    

  }
}
