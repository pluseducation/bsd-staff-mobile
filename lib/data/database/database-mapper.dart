import 'package:logger/logger.dart';

class DatabaseMapper {
  final Logger log;

  DatabaseMapper({required this.log});

  // Movie toMovie(MovieDbEntity entity) {
  //   try {
  //     return Movie(
  //       id: entity.movieId,
  //       title: entity.title,
  //       imageUrl: entity.imageUrl,
  //       releaseDate: DateTime.fromMillisecondsSinceEpoch(entity.releaseDate),
  //     );
  //   } catch (e) {
  //     throw MapperException<MovieDbEntity, Movie>(e.toString());
  //   }
  // }

  // List<Movie> toMovies(List<MovieDbEntity> entities) {
  //   final List<Movie> movies = [];

  //   for (final entity in entities) {
  //     try {
  //       movies.add(toMovie(entity));
  //     } catch (e) {
  //       log.w('Could not map entity ${entity.movieId}', error: e);
  //     }
  //   }

  //   return movies;
  // }

  // MovieDbEntity toMovieDbEntity(Movie movie) {
  //   try {
  //     return MovieDbEntity(
  //       id: null,
  //       movieId: movie.id,
  //       title: movie.title,
  //       imageUrl: movie.imageUrl,
  //       releaseDate: movie.releaseDate.millisecondsSinceEpoch,
  //     );
  //   } catch (e) {
  //     throw MapperException<Movie, MovieDbEntity>(e.toString());
  //   }
  // }

  // List<MovieDbEntity> toMovieDbEntities(List<Movie> movies) {
  //   final List<MovieDbEntity> entities = [];

  //   for (final movie in movies) {
  //     try {
  //       entities.add(toMovieDbEntity(movie));
  //     } catch (e) {
  //       log.w('Could not map movie ${movie.id}', error: e);
  //     }
  //   }

  //   return entities;
  // }
}
