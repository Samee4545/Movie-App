import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/widgets/topRated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  List trendingMovies = [];
  List popularMovies = [];
  List topRatedMovies = [];
  List tvShows = [];

  String apiKey = PASTE API KEY HERE;
  String accessToken =
      PASTE ACCESS TOKEN HERE;
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, accessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tvShows = tvResults['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text: "Movie App", color: Colors.white, size: 20),
      ),
      body: ListView(
        children: [
          TV(tv: tvShows),
          TopRatedMovies(topRated: topRatedMovies),
          TrendingMovies(trending: trendingMovies)
        ],
      ),
    );
  }
}
