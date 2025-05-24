


import 'package:cinema_application/domain/entity/movie.dart';
import 'package:cinema_application/domain/repositories/movies_repository.dart';
import 'package:cinema_application/domain/sources/movies_source.dart';

class MoviesDatarepository extends MoviesRepository{

  final MoviesSource moviesSource;

  MoviesDatarepository(this.moviesSource);

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
   return moviesSource.getNowPlayingMovies(page: page);
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) {
    return moviesSource.getPopularMovies(page: page);
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    return moviesSource.getTopRatedMovies(page: page);
  }




}