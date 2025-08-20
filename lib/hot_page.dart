import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/api/services/show_providers.dart';
import 'package:mid_term_project/widget/appbar.dart';
import 'package:mid_term_project/widget/movie_card.dart';

class HotPage extends ConsumerWidget {
  const HotPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesAsync = ref.watch(nowAiringProvider);
     return Scaffold(
       appBar: HomeAppBar(),
       body: seriesAsync.when(
        data: (shows) {
          return GridView.builder(
            padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: shows.length,
              itemBuilder: (context, index){
                final show = shows[index];
                return MovieCard(item: show);
              },
          );
        },
        loading: () =>
        const Center(child: CircularProgressIndicator(color: Colors.red)),
        error: (err, stackTrace) => Text('$err'),
           ),
     );
  }
}