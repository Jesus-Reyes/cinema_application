

import 'package:cinema_application/domain/entity/movie.dart';

class MoviesState {
  final List<Movie> playingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  

  MoviesState({
    required this.playingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    
  });



  factory MoviesState.initial() {
    return MoviesState(
      playingMovies: [],
      popularMovies: [],
      topRatedMovies: [],
      
    );
  }

  MoviesState copyWith({
    List<Movie>? playingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    bool? isLoading,  
  }) {
    return MoviesState(
      playingMovies: playingMovies ?? this.playingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      
    );
  }
}
