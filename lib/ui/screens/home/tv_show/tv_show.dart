import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/widgets/text_view.dart';
import 'package:gap/gap.dart';

class TvShow extends StatelessWidget {
  final List tvShow;
  final String? text;

  const TvShow({super.key, required this.tvShow, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextViewMovie(text: "Tv Show", size: 25),
          Container(
              height: 200.h,
              child: ListView.builder(
                itemCount: tvShow.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 220.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${tvShow[index]['backdrop_path']}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Gap(15.h),
                          // Container(
                          //   child: TextViewMovie(
                          //     text:
                          //         tvShow[index]['original_name'] ?? 'no title',
                          //   ),
                          // ),
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
