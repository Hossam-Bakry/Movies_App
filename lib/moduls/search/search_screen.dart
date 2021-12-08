import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/search/search_item.dart';
import 'package:movies_app/services/repository/api_repository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<Movies> topMovieResponce;
  List<Results> result = [];
  String searchKey = '';

  @override
  void initState() {
    super.initState();
    topMovieResponce = ApiRepository.fetchSearchMovies(searchKey);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35),
            height: 48,
            child: TextFormField(
              onChanged: (String? value) {
                setState(() {
                  searchKey = value ?? '';
                });
              },
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Color.fromRGBO(81, 79, 79, 1.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                hintText: 'search',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.separated(
          //     itemBuilder: (BuildContext context, index) {
          //       return SearchItem(
          //         loadSearchData().elementAt(index),
          //       );
          //     },
          //     separatorBuilder: (BuildContext context, index) {
          //       return Container(
          //         width: double.infinity,
          //         height: 1,
          //         color: Color.fromRGBO(181, 180, 180, 1.0),
          //       );
          //     },
          //     itemCount: loadSearchData().length,
          //   ),
          // ),
          FutureBuilder<Movies>(
            future: ApiRepository.fetchSearchMovies(searchKey),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, index) {
                    return SearchItem(snapshot.data!.results!.elementAt(index));
                    // SearchItem(snapshot.data);
                  },
                  separatorBuilder: (BuildContext context, index) {
                    return Container(
                      width: double.infinity,
                      height: 1,
                      color: Color.fromRGBO(181, 180, 180, 1.0),
                    );
                  },
                  itemCount: 1,
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ));
              }
              return Center(
                  child: const CircularProgressIndicator(
                color: Color.fromRGBO(255, 187, 59, 1.0),
              ));
            },
          )
          // Expanded(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(
          //           Icons.local_movies,
          //           color: Color.fromRGBO(181, 180, 180, 1.0),
          //           size: 150,
          //         ),
          //         Text(
          //           'No movies found',
          //           style: TextStyle(
          //             fontSize: 14,
          //             color: Color.fromRGBO(181, 180, 180, 1.0),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }

  List loadSearchData() {
    ApiRepository.fetchSearchMovies(searchKey).then((value) {
      result = value.results as List<Results>;
    }).onError((error, stackTrace) {
      print('error => ${error.toString()}');
    });
    return result;
  }
}
