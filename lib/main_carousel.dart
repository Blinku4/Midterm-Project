import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/api/api_constants.dart';
import 'package:mid_term_project/api/services/movie_provider.dart';

// State provider to keep track of current carousel index
final currentCarouselIndexProvider = StateProvider<int>((ref) => 0);

class TrendingCarousel extends ConsumerWidget {
  const TrendingCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(nowPlayingMoviesProvider);
    final currentIndex = ref.watch(currentCarouselIndexProvider);

    return moviesAsync.when(
      data: (movies) {
        return Stack(
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Stack(
                children: [Positioned.fill(

                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Image.network(
                      '${ApiConstants.baseSmallImageUrl}${movies[currentIndex].poster_path}',
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                ],
              ),
            ),
            Column(
            spacing: 25,
            children: [
              SizedBox(),
              CarouselSlider.builder(
                itemCount: movies.length,
                itemBuilder: (context, index, id) {
                  final movie = movies[index];
                  final isFocused = index == currentIndex;

                  final image = ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      '${ApiConstants.baseSmallImageUrl}${movie.poster_path}',
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  );

                  // Blur non-focused items
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: isFocused
                          ? image
                          : Stack(
                              children: [
                                ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 0.8,
                                    sigmaY: 0.8,
                                  ),
                                  child: image,
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black54.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  height: 330,
                  autoPlay: true,
                  viewportFraction: 0.6,
                  autoPlayInterval: const Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                  onPageChanged: (index, r) {
                    ref.read(currentCarouselIndexProvider.notifier).state = index;
                  },
                ),
              ),
              Column(
                spacing: 20,
                children: [
                  Text(
                    movies[currentIndex].title,
                    textAlign: TextAlign.center, // or whatever property you want
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [Icon(Icons.info_outline), Text('Detail')],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                            const Size(200, 50),
                          ), // 👈 width & height
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // 👈 rounded corners
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(Colors.red),
                        ),
                        child: Text('WATCH NOW',style: TextStyle(color:Colors.white)),
                      ),
                      Column(
                        children: [
                          Icon(Icons.bookmark_outline_sharp),
                          Text('Save'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ]
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(color: Colors.red)),
      error: (err, stackTrace) => Text('$err'),
    );
  }
}
