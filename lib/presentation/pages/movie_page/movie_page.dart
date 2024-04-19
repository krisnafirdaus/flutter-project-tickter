import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/misc/methods.dart';
import 'package:flutter_application_1/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:flutter_application_1/presentation/pages/movie_page/methods/promotion_list.dart';
import 'package:flutter_application_1/presentation/providers/movie/now_playing_provider.dart';
import 'package:flutter_application_1/presentation/providers/movie/upcoming_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'methods/search_bar.dart';
import 'methods/user_info.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFilenames = const [
    'popcorn.jpg',
    'buy1get1.jpg',
  ];

  const MoviePage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return ListView(
      children: [Column(
        children: [
          userInfo(ref),
          verticalSpace(40),
          searchBar(context),
          verticalSpace(24),
          ...movieList(title: 'Now Playing', movies: ref.watch(nowPlayingProvider), onTap:(movie) => {},),
          ...promotionList(promotionImageFilenames),
          ...movieList(title: 'Upcoming', movies: ref.watch(upcomingProvider))
        ],
      )],
    );
  }
}