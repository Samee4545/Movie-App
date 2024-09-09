import 'package:flutter/material.dart';
import 'package:movie_app/Utils/description.dart';
import 'package:movie_app/Utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: "Trending Movies",
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionScreen(
                                  name: trending[index]['title'],
                                  description: trending[index]['overview'],
                                  bannerUrl:
                                      'https://image.tmdb.org/t/p/w500${trending[index]['backdrop_path']}',
                                  posterUrl:
                                      "https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}",
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launch_date: trending[index]
                                      ['release_date'])));
                    },
                    child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              child: ModifiedText(
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'loading...'),
                            )
                          ],
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
