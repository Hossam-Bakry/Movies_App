import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';

class SearchItem extends StatelessWidget {
  Results? movie;

  SearchItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 90,
      child: Row(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' + '${movie!.posterPath}',
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  movie!.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  movie!.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                Text(
                  movie!.overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
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
