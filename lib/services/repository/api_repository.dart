import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/popular_movies.dart';
import 'package:movies_app/model/top_movies.dart';

class ApiRepository {
  //https://api.themoviedb.org/3/movie/popular?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1

  static const String apiKey = '76a5d02696258c7bb9f8379068beb9cb';
  var query = {
    'api_key': apiKey,
    'language': 'en-US',
    'page': 1,
  };

  static Future<PopularMovies> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1'),
    );
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<TopMovies> fetchTopRatedMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1'),
    );
    if (response.statusCode == 200) {
      return TopMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
