import 'package:flutter/material.dart';
import 'package:mid_term_project/widget/appbar.dart';

class ArcadePage extends StatelessWidget {
  const ArcadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.videogame_asset_off_outlined, size: 120,color: Colors.white24,),
              Text('No Arcades Available',textAlign: TextAlign.center, style:TextStyle(color: Colors.white24, fontSize: 25))
            ],
          )
      ),
    );
  }
}
