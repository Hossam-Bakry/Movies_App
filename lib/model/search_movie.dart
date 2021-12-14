class SearchMovie {
  int? page;
  List<SearchResults>? results;

  SearchMovie.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(SearchResults.fromJson(v));
      });
    }
  }
}

/// adult : false
/// backdrop_path : "/nNmJRkg8wWnRmzQDe2FwKbPIsJV.jpg"
/// genre_ids : [878,28,12]
/// id : 24428
/// original_language : "en"
/// original_title : "The Avengers"
/// overview : "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!"
/// popularity : 243.681
/// poster_path : "/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg"
/// release_date : "2012-04-25"
/// title : "The Avengers"
/// video : false
/// vote_average : 7.7
/// vote_count : 25853

class SearchResults {
  String? backdropPath;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;

  SearchResults.fromJson(Map<String, dynamic> json) {
    backdropPath = json["backdrop_path"];
    id = json["id"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
  }
}
