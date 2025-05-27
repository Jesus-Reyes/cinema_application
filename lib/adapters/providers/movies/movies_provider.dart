import 'package:cinema_application/adapters/providers/movies/movies_data.dart';
import 'package:cinema_application/adapters/providers/movies/movies_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_provider.g.dart';

@riverpod
class Movies extends _$Movies {
  @override
  Future<MoviesState> build() async {
    final initalValues = await _startLoadMovies();
    return initalValues;
  }

  Future<MoviesState> _startLoadMovies() async {

    try {
      final totalMovies = await Future.wait([
        ref.read(moviesData).getNowPlayingMovies(),
        ref.read(moviesData).getPopularMovies(),
        ref.read(moviesData).getTopRatedMovies(),
      ]);

      final state = MoviesState(
        playingMovies: totalMovies[0],
        popularMovies: totalMovies[1],
        topRatedMovies: totalMovies[2],
      );

      return state;
    } catch (e) {
      
      return MoviesState.initial();
      // return throw Exception("Error loading movies: $e");
    }
  }
}
