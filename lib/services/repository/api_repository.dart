import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/movies.dart';

class ApiRepository {
  static const String apiKey = '76a5d02696258c7bb9f8379068beb9cb';

  static Future<Movies> fetchSearch(String queryParameters) async {
    Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/search/movie',
      {
        'api_key': apiKey,
        'query': queryParameters,
      },
    );
    final response = await http.get(url);
    var searchResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return searchResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Movies> fetchMoviesData() async {
    var response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1'),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Movies> fetchPopular() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1'),
    );
    var popularResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return popularResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Movies> fetchSimilar(int movieId) async {
    var header = '/3/movie/$movieId/similar';
    Uri url = Uri.https(
      'api.themoviedb.org',
      header,
      {
        'api_key': apiKey,
      },
    );
    final response = await http.get(
      url,
      headers: {
        'movie_id': '',
      },
    );
    var similarResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return similarResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
