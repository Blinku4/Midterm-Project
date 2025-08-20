


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid_term_project/api/api_constants.dart';
import 'package:mid_term_project/detail_page.dart';
import 'package:mid_term_project/models/movie.dart';
import 'package:mid_term_project/models/series.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.item});
  final item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 7,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(id: item.id)));
              },
              child: Container(
                height: 180,
                width: 135,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${ApiConstants.baseSmallImageUrl}${item.poster_path}')),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top:8,
                      right:8,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red.withAlpha(200),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(item.vote_average.toStringAsFixed(1)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(  item is Movie ?item.title : item.name,textAlign: TextAlign.center, style: TextStyle( color: Colors.white, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
