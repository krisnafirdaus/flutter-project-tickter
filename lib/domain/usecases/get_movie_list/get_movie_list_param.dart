enum MovieListCategories { nowPlaying, upcoming }

class GetMovieListParam {
  final MovieListCategories category;
  final int page;

  GetMovieListParam({this.page = 1, required this.category});
}