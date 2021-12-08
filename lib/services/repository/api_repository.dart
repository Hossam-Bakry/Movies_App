import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/movies.dart';

class ApiRepository {
  //https://api.themoviedb.org/3/movie/popular?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1
  // static const String apiKey = '76a5d02696258c7bb9f8379068beb9cb';
  static const String apiKey = '76a5d02696258c7bb9f8379068beb9cb';

  static Future<Movies> fetchSearchMovies(String query) async {
    var q = {
      'api_key': apiKey,
      'query': query,
      'page': 1,
    };
    var uri = Uri.https(
      'api.themoviedb.org',
      '/3/search/movie',
      q,
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Movies> fetchMoviesData() async {
    // var queryParameter = {
    //   'api_key': apiKey,
    //   'page': 2,
    // };
    // var uri = Uri.https(
    //   'api.themoviedb.org',
    //   '/3/movie/top_rated',
    //   queryParameter,
    // );
    // var response = await http.get(uri);
    var response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=2'),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
