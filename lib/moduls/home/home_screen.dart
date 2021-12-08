import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/home/newRelase_movie_widget/newRelase_widget.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_widget.dart';
import 'package:movies_app/moduls/home/topRated_widget/topRated_widget.dart';
import 'package:movies_app/services/repository/api_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    // movieResponce = ApiRepository.fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder<Movies>(
              future: ApiRepository.fetchMoviesData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'error => ${snapshot.error}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: const CircularProgressIndicator(
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                  );
                }
                return PopularWidget(snapshot.data!.results!.elementAt(2));
              },
            ),
            FutureBuilder<Movies>(
              future: ApiRepository.fetchMoviesData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return NewRelaseWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    '${snapshot.error}',
                    style: TextStyle(color: Colors.white),
                  ));
                }
                return Center(
                    child: const CircularProgressIndicator(
                  color: Color.fromRGBO(255, 187, 59, 1.0),
                ));
              },
            ),
            FutureBuilder<Movies>(
              future: ApiRepository.fetchMoviesData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TopRatedWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    '${snapshot.error}',
                    style: TextStyle(color: Colors.white),
                  ));
                }
                return Center(
                    child: const CircularProgressIndicator(
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
