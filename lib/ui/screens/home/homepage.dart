import 'package:flutter/material.dart';
import 'package:movie_app/api_key/api_key.dart';
import 'package:movie_app/ui/screens/home/toprated_movies/toprated_movies.dart';
import 'package:movie_app/ui/screens/home/trending_movies/trending_movies.dart';
import 'package:movie_app/ui/screens/home/tv_show/tv_show.dart';
import 'package:movie_app/utils/widgets/text_view.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tredingMovies = [];
  List topRateMovies = [];
  List tv = [];

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(ApiKey.apiKey, ApiKey.readAccessToken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingResulte = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRateResulte = await tmdbWithCustomLogs.v3.movies.getTopRated();

    Map tvResulte = await tmdbWithCustomLogs.v3.tv.getPopular();

    debugPrint(trendingResulte.toString());

    setState(() {
      tredingMovies = trendingResulte['results'];
      topRateMovies = topRateResulte['results'];
      tv = tvResulte['results'];
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextViewMovie(text: 'Movie'),
        ),
        body: ListView(
          children: [
            TvShow(tvShow: tv),
            TopRatedMovies(topRatedMovies: topRateMovies),
            TrendingMovies(trendingMovie: tredingMovies),
          ],
        ));
  }
}
