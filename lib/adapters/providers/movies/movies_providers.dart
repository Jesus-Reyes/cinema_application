import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinema_application/domain/entity/movie.dart';
import 'package:cinema_application/adapters/providers/movies/movies_data.dart';
import 'package:cinema_application/adapters/providers/movies/movies_notifier.dart';


final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final repository = ref.watch(movieData);
  return MoviesNotifier(
    apiService: repository.getNowPlayingMovies,
  );
});


final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final repository = ref.watch(movieData);
  return MoviesNotifier(
    apiService: repository.getPopularMovies,
  );
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final repository = ref.watch(movieData);
  return MoviesNotifier(
    apiService: repository.getTopRatedMovies,
  );
});