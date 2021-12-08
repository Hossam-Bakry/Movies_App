import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_item.dart';

class PopularWidget extends StatelessWidget {
  Results movieRsponse;

  PopularWidget(this.movieRsponse);

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
                  '${movieRsponse.backdropPath}',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.065,
            child: Row(
              children: [
                PopularItem(movieRsponse),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      movieRsponse.title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      movieRsponse.releaseDate ?? '',
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
