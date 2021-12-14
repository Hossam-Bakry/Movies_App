/// adult : false
/// backdrop_path : "/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg"
/// belongs_to_collection : null
/// budget : 25000000
/// genres : [{"id":18,"name":"Drama"},{"id":80,"name":"Crime"}]
/// homepage : ""
/// id : 278
/// imdb_id : "tt0111161"
/// original_language : "en"
/// original_title : "The Shawshank Redemption"
/// overview : "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope."
/// popularity : 75.426
/// poster_path : "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"
/// production_companies : [{"id":97,"logo_path":"/7znWcbDd4PcJzJUlJxYqAlPPykp.png","name":"Castle Rock Entertainment","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1994-09-23"
/// revenue : 28341469
/// runtime : 142
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Fear can hold you prisoner. Hope can set you free."
/// title : "The Shawshank Redemption"
/// video : false
/// vote_average : 8.7
/// vote_count : 20265

class WatchList {
  bool? adult;
  String? backdropPath;
  int? budget;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? tagline;
  String? title;

  WatchList.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    budget = json["budget"];
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    revenue = json["revenue"];
    runtime = json["runtime"];
    tagline = json["tagline"];
    title = json["title"];
  }
}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class Spoken_languages {
  String? englishName;
  String? iso6391;
  String? name;

  Spoken_languages({this.englishName, this.iso6391, this.name});

  Spoken_languages.fromJson(dynamic json) {
    englishName = json["english_name"];
    iso6391 = json["iso_639_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["english_name"] = englishName;
    map["iso_639_1"] = iso6391;
    map["name"] = name;
    return map;
  }
}

/// iso_3166_1 : "US"
/// name : "United States of America"

class Production_countries {
  String? iso31661;
  String? name;

  Production_countries({this.iso31661, this.name});

  Production_countries.fromJson(dynamic json) {
    iso31661 = json["iso_3166_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["iso_3166_1"] = iso31661;
    map["name"] = name;
    return map;
  }
}

/// id : 97
/// logo_path : "/7znWcbDd4PcJzJUlJxYqAlPPykp.png"
/// name : "Castle Rock Entertainment"
/// origin_country : "US"

class Production_companies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Production_companies({this.id, this.logoPath, this.name, this.originCountry});

  Production_companies.fromJson(dynamic json) {
    id = json["id"];
    logoPath = json["logo_path"];
    name = json["name"];
    originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["logo_path"] = logoPath;
    map["name"] = name;
    map["origin_country"] = originCountry;
    return map;
  }
}

/// id : 18
/// name : "Drama"

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}
