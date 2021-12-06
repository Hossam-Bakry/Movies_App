import 'package:flutter/material.dart';
import 'package:movies_app/model/top_movies.dart';

class TopRatedItem extends StatelessWidget {
  TopMovies? topMovies;
  int index;

  TopRatedItem(this.topMovies, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 185,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color.fromRGBO(52, 53, 52, 1.0),
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      '${topMovies!.results!.elementAt(index).posterPath}',
                  fit: BoxFit.cover,
                  width: 110,
                  height: 130,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset('assets/images/ic_bookmark.png'),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.grade,
                      size: 18,
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${topMovies!.results!.elementAt(index).voteAverage}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  topMovies!.results!.elementAt(index).title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  topMovies!.results!.elementAt(index).releaseDate ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}