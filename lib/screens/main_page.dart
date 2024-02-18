import 'package:flutter/material.dart';
import 'package:testproj1/widgets/app_state_provider.dart';
import 'package:testproj1/models/app_state.dart';
import 'package:testproj1/Screens/image_level1_page.dart';
import 'package:testproj1/Screens/image_level2_page.dart';
import 'package:testproj1/Screens/video_level_page.dart';
import 'package:testproj1/Screens/summary_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Misinformation Game')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigate to Level 1 page (media headline recognition)
              Navigator.pushNamed(context, '/image_level1');
            },
            child: Text('Media Headline Recognition'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Level 2 page (media images recognition)
              Navigator.pushNamed(context, '/image_level2');
            },
            child: Text('Media Images Recognition'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Level 3 page (media deepfake recognition)
              Navigator.pushNamed(context, '/video_level');
            },
            child: Text('Media Deepfake Recognition'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Summary page
              Navigator.pushNamed(context, '/summary');
            },
            child: Text('Summary'),
          ),
        ],
      ),
    );
  }
}
