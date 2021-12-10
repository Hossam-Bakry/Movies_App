import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_item.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_widget.dart';
import 'package:movies_app/services/repository/api_repository.dart';

class WatchListScreen extends StatelessWidget {
  Movies? movies;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemBuilder: (buildContext, index) {
        return FutureBuilder<Movies>(
          future: ApiRepository.fetchMoviesData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'error => ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: const CircularProgressIndicator(
                  color: Color.fromRGBO(255, 187, 59, 1.0),
                ),
              );
            }
            return PopularWidget(snapshot.requireData);
          },
        );
      },
      itemCount: resdata.length,
    ));
  }
}
