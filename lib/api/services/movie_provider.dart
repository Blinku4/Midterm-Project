import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/api/services/dio_service.dart';
import 'package:mid_term_project/api/services/movie_repository.dart';
import 'package:mid_term_project/api/services/movie_service.dart';

import '../../models/movie.dart';


final dioProvider = Provider((ref) =>DioClient().dio);

final movieServiceProvider = Provider((ref) =>MovieService(ref.watch(dioProvider)));

final movieRespositoryProvider = Provider((ref) => MovieRepository(ref.watch(movieServiceProvider))); // this will talk with the api

final popularMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final repo = ref.watch(movieRespositoryProvider);
  return repo.getPopularMovies();
});

final upcomingMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final repo = ref.watch(movieRespositoryProvider);
  return repo.getUpcoming();
});

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final repo = ref.watch(movieRespositoryProvider);
  return repo.getTopRated();
});
final nowPlayingMoviesProvider = FutureProvider<List<Movie>>((ref) {
  final repo = ref.watch(movieRespositoryProvider);
  return repo.getNowPlaying();
});
final movieDetailsProvider = FutureProvider.family<Movie, int>((ref, movieId){
  final repo = ref.watch(movieRespositoryProvider);
  return repo.getMovieDetail(movieId);
});