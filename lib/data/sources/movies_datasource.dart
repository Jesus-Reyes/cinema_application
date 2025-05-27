import 'package:cinema_application/config/environments/environment.dart';
import 'package:cinema_application/data/mappers/movie_mmaper.dart';
import 'package:cinema_application/data/models/movie_rest.dart';
import 'package:cinema_application/domain/entity/movie.dart';
import 'package:cinema_application/domain/sources/movies_source.dart';
import 'package:dio/dio.dart';

class MoviesDatasource extends MoviesSource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDBKey,
      'language': 'es-MX',
    },
  ));


  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    return _getMoviesByEndpoint('/movie/now_playing', page: page);
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    return _getMoviesByEndpoint('/movie/popular', page: page);
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return _getMoviesByEndpoint('/movie/top_rated', page: page);
  }


  Future<List<Movie>> _getMoviesByEndpoint(String endpoint, {int page = 1}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: {'page': page});
      
      if (response.statusCode == 200 && response.data != null) {
        final movieRest = MovieRest.fromJson(response.data);
        return movieRest.results.map(MovieMapper.movieRestToEntity).toList();
      }
      return throw Exception("Error fetching movies from $endpoint: ${response.statusMessage}");
    } catch (e) {
      // Log error or handle exception
      // print('Error fetching movies from $endpoint: $e');
      throw Exception("Error fetching movies from $endpoint: $e");
    }
  }
}
