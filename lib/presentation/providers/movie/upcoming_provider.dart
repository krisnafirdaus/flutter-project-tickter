import 'package:flutter_application_1/domain/entities/movie.dart';
import 'package:flutter_application_1/domain/entities/result.dart';
import 'package:flutter_application_1/domain/usecases/get_movie_list/get_movie_list.dart';
import 'package:flutter_application_1/domain/usecases/get_movie_list/get_movie_list_param.dart';
import 'package:flutter_application_1/presentation/providers/usecases/get_movie_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_provider.g.dart';

@Riverpod(keepAlive: true)
class Upcoming extends _$Upcoming {
  @override
  FutureOr<List<Movie>> build() => const [];

  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();

    GetMovieList getMovieList = ref.read(getMovieListProvider);

    var result = await getMovieList(GetMovieListParam(category: MovieListCategories.upcoming, page: page));

    switch(result){
      case Success(value: final movies):
        state = AsyncData(movies);
      case Failed(message: final message):
        state = const AsyncData([]);
    }
  }
}