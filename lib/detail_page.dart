import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/api/api_constants.dart';
import 'package:mid_term_project/api/services/movie_provider.dart';
import 'package:mid_term_project/api/services/show_providers.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailAsync = ref.watch(movieDetailsProvider(id));
    final showDetailAsync = ref.watch(showDetailProvider(id));
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.cast),
          )
        ],
      ),
      body: movieDetailAsync.when(
        data: (item) {
          return SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Positioned.fill(
                        child: ImageFiltered(
                          imageFilter:ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Image.network(
                            '${ApiConstants.baseSmallImageUrl}${item
                                .backdrop_path}', fit: BoxFit.contain,height: 100,),
                        ),
                      ),
                    ),
                      Positioned(
                        left: 30,
                        bottom: -40,
                        child: Row(
                          spacing: 10,
                          children: [
                            ClipRRect(
                              child: Image.network('${ApiConstants.baseSmallImageUrl}${item.poster_path}', height: 170,),
                            ),
                            Column(
                              spacing: 7,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title, style: TextStyle(fontWeight: FontWeight.w500),),
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.star, color: Colors.red),
                                    Text(item.vote_average.toStringAsFixed(1)),
                                    Text('(${item.vote_count} voted)',style: TextStyle(color:Colors.white10.withAlpha(400)))
                                  ],
                                )

                              ],
                            ),
                          ],
                        ),
                      )
            ]
                  ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.play_arrow),
                        label: Text('Watch'),
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                            const Size(150, 50),
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
                      ),
                      ElevatedButton.icon(
                        iconAlignment: IconAlignment.end ,
                        icon: Icon(Icons.save_alt_rounded),
                        label: Text('Download'),
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                            const Size(150, 50),
                          ), // 👈 width & height
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // 👈 rounded corners
                            ),
                          ),
                          //backgroundColor: WidgetStateProperty.all(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 6,
                        children: [
                          SizedBox(width: 10,),
                          Column(children: [Icon(Icons.bookmark_outline_sharp), Text('Add')],),
                          Column(children: [Icon(Icons.ondemand_video), Text('Trailer')],),
                          Column(children: [Icon(Icons.send), Text('Share')],),
                        ],
                      ),
                      Row(
                        children: [Column(children: [Icon(Icons.flag_outlined), Text('Report')],),SizedBox(width: 10,),],
                      ),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 4,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:  Text('OverView',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w500)) ,
                        ),
                        Text('${item.overview}', textAlign: TextAlign.justify,style: TextStyle(height: 1.5),)

                      ],
                    ),
                  ),
                ],
              )

          );
        }, loading: () =>
      const Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
        error: (err, stackTrace) =>
            Center(
              child: Text('Error: $err'),
            ),
      ),
    );
  }
}
