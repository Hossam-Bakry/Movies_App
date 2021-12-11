import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/home/DetailsScreen/DetailsScreen.dart';

class PopularItem extends StatelessWidget {
  Movies? topMovies;

  PopularItem(this.topMovies);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 300,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, DetailsScreen.routeName, arguments: topMovies);
            },
            child: Image.network(
              'https://image.tmdb.org/t/p/w500' +
                  '${topMovies!.results!.elementAt(5).posterPath}',
              fit: BoxFit.cover,
              width: 130,
              height: 200,
            ),
          ),
          InkWell(
              onTap: () {
                resdata.add(topMovies);
              },

              child: Image.asset('assets/images/ic_bookmark.png')),
        ],
      ),
    );
  }
}

List<Movies?>resdata = [];
