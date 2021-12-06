import 'package:flutter/material.dart';
import 'package:movies_app/model/top_movies.dart';

class PopularItem extends StatelessWidget {
  TopMovies? topMovies;

  PopularItem(this.topMovies);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 300,
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' +
                '${topMovies!.results!.elementAt(5).posterPath}',
            fit: BoxFit.cover,
            width: 130,
            height: 200,
          ),
          Image.asset('assets/images/ic_bookmark.png'),
        ],
      ),
    );
  }
}
