


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/api/services/dio_service.dart';
import 'package:mid_term_project/api/services/series_service.dart';
import 'package:mid_term_project/api/services/show_repository.dart';
import 'package:mid_term_project/models/series.dart';

final dioProvider = Provider((ref) => DioClient().dio);

final showServiceProvider = Provider((ref) => TVShowService(ref.watch(dioProvider)));

final  showRepositoryProvider = Provider((ref) => TVShowRepository(ref.watch(showServiceProvider)));

final popularShowsProvider = FutureProvider<List<TVShow>>((ref) {
  final repo = ref.watch(showRepositoryProvider);
  return repo.getPopularShow();
});

final nowAiringProvider = FutureProvider<List<TVShow>>((ref) {
  final repo = ref.watch(showRepositoryProvider);
  return repo.getAiringToday();
});

final topRatedProvider = FutureProvider<List<TVShow>>((ref) {
  final repo = ref.watch(showRepositoryProvider);
  return repo.getTopRated();
});

final showDetailProvider = FutureProvider.family<TVShow, int>((ref, showId) {
  final repo = ref.watch(showRepositoryProvider);
  return repo.getShowDetail(showId);
});