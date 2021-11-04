import 'dart:convert';

import 'package:get_it/get_it.dart';

import 'package:movie_app/models/app_config.dart';

class Movie {
  Movie({
    this.name,
    this.language,
    this.isAdult,
    this.description,
    this.posterPath,
    this.backDropPath,
    this.rating,
    this.releaseDate,
  });

  final String? name;
  final String? language;
  final bool? isAdult;
  final String? description;
  final String? posterPath;
  final String? backDropPath;
  final num? rating;
  final String? releaseDate;

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backDropPath: _json['backdrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }
  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    if (posterPath != null) {
      return '${_appConfig.BASE_IMAGE_API_URL}$posterPath';
    } else {
      return 'https://via.placeholder.com/200x300?text=No+Image';
    }
  }
}
