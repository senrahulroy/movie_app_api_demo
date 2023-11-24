import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/widgets/text_view.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRatedMovies;
  final String? text;

  const TopRatedMovies({super.key, required this.topRatedMovies, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextViewMovie(text: "Top rated movies", size: 25),
          Container(
              height: 250.h,
              child: ListView.builder(
                itemCount: topRatedMovies.length,
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
                                    'https://image.tmdb.org/t/p/w500${topRatedMovies[index]['poster_path']}'),
                              ),
                            ),
                          ),
                          SizedBox(
                              child: TextViewMovie(
                                  text: topRatedMovies[index]['title'] ??
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
