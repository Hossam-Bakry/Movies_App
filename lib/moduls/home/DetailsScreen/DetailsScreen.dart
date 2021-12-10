import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/moduls/home/popular_movie_widget/popular_item.dart';
import 'package:movies_app/moduls/home/topRated_widget/topRated_item.dart';
import 'package:movies_app/services/style/theme.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    var movies = ModalRoute.of(context)!.settings.arguments as Movies;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primaryColor,
        title: Text(movies.results!.elementAt(5).title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.22,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          '${movies.results!.elementAt(5).backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      movies.results!.elementAt(5).title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      movies.results!.elementAt(5).releaseDate ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                    // PopularItem(movies),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: PopularItem(movies),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          // No attribute in the API refers to movie Type !!!!!!!!!!!!!!!!
                          // No attribute in the API refers to movie Type !!!!!!!!!!!!!!!!
                          // No attribute in the API refers to movie Type !!!!!!!!!!!!!!!!
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Action',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movies.results!.elementAt(5).overview ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${movies.results!.elementAt(5).voteAverage}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(40, 42, 40, 1.0),
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 5),
                        child: Text(
                          'More Like This',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              TopRatedItem(movies, index),
                          itemCount: movies.results!.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
