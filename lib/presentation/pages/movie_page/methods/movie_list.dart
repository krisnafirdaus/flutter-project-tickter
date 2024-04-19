import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieList(
  {required String title,
    void Function(Movie movie)? onTap,
    required AsyncValue<List<Movie>> movies,
  }
) => [];