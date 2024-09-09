import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;
  const TopRatedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: "Top Rated Movies",
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${topRated[index]['poster_path']}'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              child: ModifiedText(
                                  text: topRated[index]['title'] != null
                                      ? topRated[index]['title']
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
