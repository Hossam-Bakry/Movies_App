import 'package:flutter/material.dart';
import 'package:movies_app/model/top_movies.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_item.dart';

class PopularWidget extends StatelessWidget {
  TopMovies? topMovies;

  PopularWidget(this.topMovies);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.30,
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.22,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500' +
                  '${topMovies!.results!.elementAt(5).backdropPath}',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.065,
            child: Row(
              children: [
                PopularItem(topMovies),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      topMovies!.results!.elementAt(5).title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      topMovies!.results!.elementAt(5).releaseDate ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
