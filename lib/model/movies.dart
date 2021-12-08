class Movies {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  int? status_code;
  String? status_message;
  bool? success;

  Movies.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
    status_code = json["status_code"];
    status_message = json["status_message"];
    success = json["success"];
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"] as double;
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }
}
