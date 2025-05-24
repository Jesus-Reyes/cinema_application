import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinema_application/domain/entity/movie.dart';



class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  final Future<List<Movie>> Function({required int page}) apiService;

  MoviesNotifier({
    required this.apiService,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;

    final List<Movie> movies = await apiService(page: currentPage);
    state = [...state, ...movies];

    isLoading = false;
  }
}
