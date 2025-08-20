class Movie{
  final String? backdrop_path;
 // final List<int>? genre_ids;
  final int id;
  final String? original_language;
  final String? overview;
  final String poster_path;
  final String title;
  final bool? video;
  final double vote_average;
  final int? vote_count;

  Movie({ this.backdrop_path
    ,required this.id,  this.original_language,  this.overview, required this.poster_path, required this.title,  this.video, required this.vote_average,  this.vote_count});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdrop_path: json['backdrop_path'] ?? '',
    //  genre_ids: json['genre_ids'] ?? [],
      id: json['id'],
      original_language: json['original_language'] ?? '',
      overview: json['overview'] ?? '',
      poster_path: json['poster_path'],
      title: json['title'],
      video: json['video'] ?? false,
      vote_average: json['vote_average'],
      vote_count: json['vote_count'] ?? 0
    );
  }
}