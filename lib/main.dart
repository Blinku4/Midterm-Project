import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mid_term_project/api/api_constants.dart';
import 'package:mid_term_project/api/services/movie_provider.dart';
import 'package:mid_term_project/api/services/show_providers.dart';
import 'package:mid_term_project/homepage_body.dart';
import 'package:mid_term_project/widget/bottom_bar.dart';
import 'package:mid_term_project/widget/movie_card.dart';

import 'homepage.dart';
import 'main_carousel.dart';

void main(){
  runApp(
    ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext ctx){
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
    );


  }
}

