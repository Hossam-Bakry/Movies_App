import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';

class PopularItem extends StatelessWidget {
  Results movieRsponse;

  PopularItem(this.movieRsponse);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 300,
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' + '${movieRsponse.posterPath}',
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
