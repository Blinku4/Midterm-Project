import 'package:flutter/material.dart';
import 'package:mid_term_project/widget/appbar.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save_alt, size: 120,color: Colors.white24,),
            Text('No Downloads',textAlign: TextAlign.center, style:TextStyle(color: Colors.white24, fontSize: 25))
          ],
        )
      ),
    );
  }
}
