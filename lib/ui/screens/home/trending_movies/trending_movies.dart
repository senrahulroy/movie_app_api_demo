import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/widgets/text_view.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovie;
  final String? text;

  const TrendingMovies({super.key, required this.trendingMovie, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextViewMovie(text: "Trending Movies", size: 25),
          Container(
              height: 250.h,
              child: ListView.builder(
                itemCount: trendingMovie.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      width: 140.w,
                      child: Column(
                        children: [
                          Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${trendingMovie[index]['poster_path']}'),
                              ),
                            ),
                          ),
                          SizedBox(
                              child: TextViewMovie(
                                  text: trendingMovie[index]['title'] ??
                                      'no title'))
                        ],
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
