import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/widget/movie_card.dart';

class ItemsRow extends ConsumerWidget {
  const ItemsRow({super.key, required this.title,required this.isPopular, required this.items});
  final bool isPopular;
  final String title;
  final List<AsyncValue> items;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: items.map((item){
        return item.when(
          data: (data) => Column(
            mainAxisSize: MainAxisSize.max,
            spacing: 5,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
                  Text("View all", style: TextStyle(color: Colors.white38, decoration: TextDecoration.underline ))
                ],
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                 // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (ctx, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MovieCard(item: data[index]),
                    );
                  },
                ),
              )
            ],
          ) ,
          error: (err, stack) => Center(child: Text("${err}")),
          loading: () => Center(),
        );
      }).toList(),
    );

  }
}
