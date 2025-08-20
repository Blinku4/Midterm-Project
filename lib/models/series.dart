class TVShow{
  final String? backdrop_path;
  final String? first_air_date;
 // final List<int>? genre_ids;
  final int? id;
  final String name;
  final String? original_language;
  final String? overview;
  final String poster_path;
  final double vote_average;
  final int? vote_count;

  TVShow({this.original_language,  this.backdrop_path, required this.first_air_date, required this.id, required this.name, required this.overview, required this.poster_path, required this.vote_average, required this.vote_count});

  factory TVShow.fromJson(Map<String, dynamic> json){
    return TVShow(
      backdrop_path: json['backdrop_path'] ?? '',
      first_air_date: json['first_air_date'] ?? '',
     // genre_ids: json['genre_ids'] ?? [],
      id: json['id'],
      name: json['name'],
      overview: json['overview'] ?? '',
      poster_path: json['poster_path'],
      vote_count: json['vote_count'] ?? 0,
      vote_average: json['vote_average']
    );
  }
}