import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';

class ItemPhotoWidget extends StatelessWidget {
  Results? movieResult;

  ItemPhotoWidget(this.movieResult);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500' + '${movieResult!.posterPath}',
            fit: BoxFit.cover,
            width: 110,
            height: 130,
          ),
        ),
        InkWell(
          onTap: () {
            movieResult!.id;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('assets/images/ic_bookmark.png'),
          ),
        ),
      ],
    );
  }
}
