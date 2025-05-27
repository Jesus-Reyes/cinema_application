

import 'package:cinema_application/domain/entity/movie.dart';
import 'package:cinema_application/data/models/movie_results_rest.dart';

class MovieMapper {

  static Movie movieRestToEntity(MovieResultsRest moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: moviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://i.imgur.com/6X2v0rO.png',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath != '' 
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'no-poster', 
        releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now() ,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );



  
}
