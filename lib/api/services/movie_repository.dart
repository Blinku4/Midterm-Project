

import 'package:mid_term_project/api/services/movie_service.dart';

import '../../models/movie.dart';

class MovieRepository{
  final MovieService apiService;
  MovieRepository(this.apiService);

  Future<List<Movie>> getPopularMovies() => apiService.getPopularMovies();
  Future<List<Movie>> getNowPlaying() => apiService.getNowPlaying();
  Future<List<Movie>> getTopRated() => apiService.getTopRated();
  Future<List<Movie>> getUpcoming() => apiService.getUpcoming();
  Future<Movie> getMovieDetail(int movieId) => apiService.getMovieDetail(movieId);
}