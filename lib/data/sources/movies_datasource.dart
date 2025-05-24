import 'package:cinema_application/domain/entity/movie.dart';
import 'package:cinema_application/domain/sources/movies_source.dart';

class MoviesDatasource extends MoviesSource {

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
   return [];
  }


  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    return [];
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return [];
  }
  
  
}
