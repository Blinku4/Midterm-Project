import 'package:dio/dio.dart';
import '../../models/movie.dart';
import '../api_constants.dart';

class MovieService{
  final Dio dio;

  MovieService(this.dio);

  Future<List<Movie>> getPopularMovies() async{
    final response = await dio.get("/movie/popular");
    final results = response.data['results'] as List;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<Movie> getMovieDetail(int movieId) async{
    final response = await dio.get("/movie/$movieId");
    return Movie.fromJson(response.data);
  }

  Future<List<Movie>> getNowPlaying() async{
    final response = await dio.get('/movie/now_playing');
    final results = response.data['results'] as List;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getTopRated() async{
    final response = await dio.get('/movie/top_rated');
    final results = response.data['results'] as List;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getUpcoming() async{
    final response = await dio.get('/movie/upcoming');
    final results = response.data['results'] as List;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

}