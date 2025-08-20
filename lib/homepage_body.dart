import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' ;
import 'package:mid_term_project/api/services/show_providers.dart';
import 'package:mid_term_project/widget/items_row.dart';
import 'package:mid_term_project/widget/movie_card.dart';

import 'api/services/movie_provider.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMoviesAsync = ref.watch(popularMoviesProvider);
    final popularSeriesAsync = ref.watch(popularShowsProvider);
    final latestMoviesAsync = ref.watch(nowPlayingMoviesProvider);
    final latestSeriesAsync = ref.watch(nowAiringProvider);
    final topRatedAsync = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(),
          ItemsRow(title: "Popular", isPopular: false, items: [popularSeriesAsync]),
          ItemsRow(title: "Latest Movies", isPopular: false, items: [latestMoviesAsync]),
          ItemsRow(title: "Latest TV Series", isPopular: false, items: [latestSeriesAsync]),
          ItemsRow(title: "Upcoming", isPopular: false, items: [upcomingMovies]),
          ItemsRow(title: "Top Rated", isPopular: true, items: [topRatedAsync]),
        ],
      ),
    );
  }
}
