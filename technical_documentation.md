## Cinema Application - Technical Documentation

### Architecture
The application follows a clean architecture approach with the following layers:

1. **Domain Layer**
   - Entities: Core business models like Movie
   - Repositories (interfaces): Define data access contracts
   - Sources: Define external data source contracts

2. **Data Layer**
   - Models: API response models (MovieRest, MovieResultsRest)
   - Mappers: Convert API models to domain entities (MovieMapper)
   - Repositories (implementation): Implement domain repositories (MoviesDatarepository)
   - Sources: Implement data fetching from APIs (MoviesDatasource)

3. **UI Layer**
   - Pages: Full screen UI components (MoviesPage)
   - Widgets: Reusable UI components (SearchMoviesWidget, CategoriesWidget, FeaturedMoviesWidget)
   - State handling via providers

4. **Adapters Layer**
   - Providers: Riverpod providers to expose data to UI
   - State models: UI state representation (MoviesState)

### Technical Stack

#### Libraries and Packages
- **flutter_riverpod (v2.6.1)**: State management solution
- **riverpod_annotation (v2.6.1)**: Code generation for Riverpod
- **card_swiper (v3.0.1)**: For movie card carousel implementation
- **dio (v5.8.0+1)**: HTTP client for API requests to TMDB
- **flutter_dotenv (v5.2.1)**: Environment variable management (.env file)
- **go_router (v15.1.2)**: Declarative routing solution
- **intl (v0.20.2)**: Internationalization and formatting

#### Folder Structure
```
lib/
├── adapters/
│   └── providers/
│       └── movies/
│           ├── movies_data.dart
│           ├── movies_provider.dart
│           ├── movies_provider.g.dart
│           └── movies_state.dart
├── config/
│   ├── environments/
│   │   └── environment.dart
│   └── theme/
│       └── app_theme.dart
├── data/
│   ├── mappers/
│   │   └── movie_mmaper.dart
│   ├── models/
│   │   ├── movie_rest.dart
│   │   └── movie_results_rest.dart
│   ├── repositories/
│   │   └── movies_datarepository.dart
│   └── sources/
│       └── movies_datasource.dart
├── domain/
│   ├── entity/
│   │   └── movie.dart
│   ├── repositories/
│   │   └── movies_repository.dart
│   └── sources/
│       └── movies_source.dart
├── ui/
│   └── movies/
│       ├── movies_routes.dart
│       ├── pages/
│       │   ├── index.dart
│       │   ├── movies_page.dart
│       │   └── movie_page.dart
│       └── widgets/
│           ├── appbar_widget.dart
│           ├── categories_widget.dart
│           ├── featured_movies_widget.dart
│           ├── movie_card_widget.dart
│           └── search_movies_widget.dart
├── app_router.dart
└── main.dart
```

### Technical Implementation Details

#### State Management
- Using Riverpod for state management with code generation
- Created AsyncNotifiers for handling async data fetching
- All providers are in the adapters/providers directory

#### API Integration
- TMDB API integration via Dio HTTP client
- Base URL: https://api.themoviedb.org/3
- Environment variables for API key
- Endpoints implemented:
  - /movie/now_playing
  - /movie/popular
  - /movie/top_rated

#### Movies Data Flow
1. `MoviesDatasource` fetches raw data from TMDB API
2. `MoviesDatarepository` processes this data
3. `MoviesProvider` exposes the data to the UI
4. UI components consume the data via `ref.watch(moviesProvider)`

#### UI Components - Technical Details
1. **Search Bar**
   - Custom TextField with InputDecoration
   - Conditional styling based on theme brightness

2. **Categories Widget**
   - Riverpod state providers for selected category
   - Horizontal ListView with custom category items

3. **Featured Movies Carousel**
   - Card Swiper implementation with viewportFraction and scale
   - Custom pagination indicators
   - Auto-playing capability with configurable delay

### Technical Debt & Next Tasks
- Add proper error handling in the API layer with error models
- Implement caching for API responses
- Add unit tests for repositories and providers
- Set up widget tests for UI components
- Optimize image loading and caching
- Implement proper logging system
