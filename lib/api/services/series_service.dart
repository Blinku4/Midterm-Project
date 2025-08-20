import 'package:dio/dio.dart';
import 'package:mid_term_project/models/series.dart';

class TVShowService{
  final Dio dio;

  TVShowService(this.dio);

  Future<List<TVShow>> getAiringToday() async{
    final response = await dio.get('/tv/airing_today');
    final results = response.data['results'] as List;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }

  Future<List<TVShow>> getPopularTV() async{
    final response = await dio.get('/tv/popular');
    final results = response.data['results'] as List;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }

  Future<List<TVShow>> getTopRated() async{
    final response = await dio.get('/tv/top_rated');
    final results = response.data['results'] as List;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }
  Future<TVShow> getShowDetail(int showId) async{
    final response = await dio.get('/tv/${showId}');
    return TVShow.fromJson(response.data);
  }
}