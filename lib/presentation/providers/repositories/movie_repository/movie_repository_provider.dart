import 'package:flutter_application_1/data/repositories/movie_repository.dart';
import 'package:flutter_application_1/data/tmdb/tmdb_movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) => TmdbMovieRepository();