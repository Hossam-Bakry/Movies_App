import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/home/DetailsScreen/DetailsScreen.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_item.dart';

class NewRelaseItem extends StatelessWidget {
  Movies? topMovies;
  int index;

  NewRelaseItem(this.topMovies, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, DetailsScreen.routeName,
                  arguments: topMovies);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500' +
                    '${topMovies!.results!.elementAt(index).posterPath}',
                fit: BoxFit.cover,
                width: 130,
                height: 200,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              resdata.add(topMovies);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset('assets/images/ic_bookmark.png'),
            ),
          ),
        ],
      ),
    );
  }
}
