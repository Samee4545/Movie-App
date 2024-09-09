import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';

class DescriptionScreen extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launch_date;
  const DescriptionScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerUrl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: "   ⭐ Average Rating " + vote,
                      size: 18,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ModifiedText(
                  text: name,
                  size: 25,
                ),
                SizedBox(
                  height: 1,
                ),
                ModifiedText(
                  text: "Release Date: " + launch_date,
                  size: 16,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(posterUrl),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: ModifiedText(
                        text: description,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
