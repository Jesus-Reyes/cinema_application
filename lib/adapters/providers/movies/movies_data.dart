import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinema_application/data/sources/movies_datasource.dart';
import 'package:cinema_application/data/repositories/movies_datarepository.dart';

final moviesData = Provider((ref) => MoviesDatarepository(MoviesDatasource()));