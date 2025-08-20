

import 'package:mid_term_project/api/services/series_service.dart';
import 'package:mid_term_project/models/series.dart';

class TVShowRepository{
  final TVShowService showService;

  TVShowRepository(this.showService);

  Future<List<TVShow>> getAiringToday() => showService.getAiringToday();
  Future<List<TVShow>> getPopularShow() => showService.getPopularTV();
  Future<List<TVShow>> getTopRated() => showService.getTopRated();
  Future<TVShow> getShowDetail(showId) => showService.getShowDetail(showId);
}