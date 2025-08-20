import 'package:flutter/material.dart';
import 'package:mid_term_project/widget/appbar.dart';
import 'package:mid_term_project/widget/drawer.dart';

import 'homepage_body.dart';
import 'main_carousel.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      appBar: HomeAppBar(),
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 5,),
            TrendingCarousel(),
            HomeBody(),
          ],
        ),
      ),

    );
  }
}