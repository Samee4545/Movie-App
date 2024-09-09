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

  String apiKey = '9263f74af1ae35ef5f395a1fc9427f29';
  String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MjYzZjc0YWYxYWUzNWVmNWYzOTVhMWZjOTQyN2YyOSIsIm5iZiI6MTcyNTgxMzMyMC4zMDE0MDUsInN1YiI6IjY2ZGRkMDBhNDlmYjQyZWFmNDM4YmZlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XVQgoRQj4SebDdi5RbZkiO98RIkrn-dEKkHXMSPPW5M';
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
