import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/popular_movies.dart';
import 'package:movies_app/model/top_movies.dart';
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
  late Future<PopularMovies> movieResponce;
  late Future<TopMovies> topMovieResponce;

  @override
  void initState() {
    super.initState();
    // movieResponce = ApiRepository.fetchPopularMovies();
    topMovieResponce = ApiRepository.fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            FutureBuilder<TopMovies>(
              future: topMovieResponce,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PopularWidget(snapshot.data);
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
            FutureBuilder<TopMovies>(
              future: topMovieResponce,
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
            FutureBuilder<TopMovies>(
              future: topMovieResponce,
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
