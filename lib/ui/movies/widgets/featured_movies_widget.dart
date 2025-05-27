import 'package:card_swiper/card_swiper.dart';
import 'package:cinema_application/domain/entity/movie.dart';
import 'package:cinema_application/ui/movies/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';

class FeaturedMoviesWidget extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  final VoidCallback? onSeeAllPressed;

  const FeaturedMoviesWidget({
    super.key,
    required this.movies,
    this.title = 'Feature Movies',
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const SizedBox.shrink();
    }
    
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.75;
    final cardHeight = cardWidth * 1.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onSeeAllPressed,
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]
                            : Colors.grey[700],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[400]
                          : Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: cardHeight,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return MovieCardWidget(
                movie: movies[index],
                width: cardWidth,
                height: cardHeight,
                onTap: () {
                  // Handle movie tap
                  print('Tapped on movie: ${movies[index].title}');
                  // Navigate to movie details
                  // Navigator.of(context).push(...);
                },
              );
            },
            itemCount: movies.length,
            viewportFraction: 0.8,
            scale: 0.9,
            
            autoplay: movies.length > 1,
            autoplayDelay: 5000,
            layout: SwiperLayout.DEFAULT,
          ),
        ),
      ],
    );
  }
}
