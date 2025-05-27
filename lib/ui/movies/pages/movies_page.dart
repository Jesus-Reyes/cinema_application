import 'package:cinema_application/adapters/providers/movies/movies_provider.dart';
import 'package:cinema_application/ui/movies/widgets/appbar_widget.dart';
import 'package:cinema_application/ui/movies/widgets/categories_widget.dart';
import 'package:cinema_application/ui/movies/widgets/featured_movies_widget.dart';
import 'package:cinema_application/ui/movies/widgets/search_movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesPage extends ConsumerWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(moviesProvider);

    return SafeArea(
      child: Scaffold(
        body: moviesState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (moviesData) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: CustomScrollView(slivers: [
              AppbarWidget(),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchMoviesWidget(),
                    const CategoriesWidget(),
                    FeaturedMoviesWidget(
                      movies: moviesData.playingMovies,
                      title: 'Feature Movies',
                      onSeeAllPressed: () {
                        // Navigate to see all featured movies
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
