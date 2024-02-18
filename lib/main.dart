// void main() => runApp(App());

// class App extends StatelessWidget {
//   final appState = AppState();

//   @override
//   Widget build(BuildContext context) {
//     return AppStateProvider<AppState>(
//       appState: appState,
//       child: MaterialPage(),
//     );
//   }
// }

// class MaterialPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = AppStateProvider.of<AppState>(context).currentTheme;

//     return ValueBuilder<MyTheme>(
//         streamed: theme,
//         builder: (context, snapshot) {
//           return MaterialApp(
//               title: 'Trivia example',
//               theme: _buildThemeData(snapshot.data),
//               home: HomePage());
//         });
//   }

//   ThemeData _buildThemeData(MyTheme appTheme) {
//     return ThemeData(
//       brightness: appTheme.brightness,
//       backgroundColor: appTheme.backgroundColor,
//       scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
//       primaryColor: appTheme.primaryColor,
//       primaryColorBrightness: appTheme.primaryColorBrightness,
//       accentColor: appTheme.accentColor,
//     );
//   }
// }

// main_page.dart
// import 'package:flutter/material.dart';

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Main Page')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Choose Difficulty Level:'),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the selected difficulty level page
//                 Navigator.pushNamed(context, '/text_level');
//               },
//               child: Text('Easy'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the selected difficulty level page
//                 Navigator.pushNamed(context, '/image_level');
//               },
//               child: Text('Medium'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the selected difficulty level page
//                 Navigator.pushNamed(context, '/video_level');
//               },
//               child: Text('Hard'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // main.dart
// import 'package:flutter/material.dart';
// import 'package:your_project_name/widgets/app_state_provider.dart';
// import 'package:your_project_name/widgets/value_builder.dart';
// import 'package:your_project_name/models/app_state.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final AppState appState = AppState();

//   @override
//   Widget build(BuildContext context) {
//     return ValueBuilder<String>(
//       stream: appState.themeStream,
//       builder: (context, theme) {
//         return AppStateProvider(
//           appState: appState,
//           child: MaterialApp(
//             theme: theme == 'light' ? ThemeData.light() : ThemeData.dark(),
//             home: MainPage(),
//           ),
//         );
//       },
//     );
//   }
// }
// main.dart
// import 'package:flutter/material.dart';
// import 'package:your_project_name/widgets/app_state_provider.dart';
// import 'package:your_project_name/widgets/value_builder.dart';
// import 'package:your_project_name/models/app_state.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   final appState = AppState();

//   @override
//   Widget build(BuildContext context) {
//     return ValueBuilder<String>(
//       stream: appState.themeStream,
//       builder: (context, theme) {
//         return AppStateProvider(
//           appState: appState,
//           child: MaterialApp(
//             title: 'Your Game Name',
//             theme: theme == 'light' ? ThemeData.light() : ThemeData.dark(),
//             initialRoute: '/',
//             routes: {
//               '/': (context) => MainPage(),
//               '/text_level': (context) => TextLevelPage(),
//               '/image_level': (context) => ImageLevelPage(),
//               '/video_level': (context) => VideoLevelPage(),
//             },
//           ),
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/widgets/value_builder.dart';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/screens/main_page.dart';
// import 'package:testproj1/screens/image_level1_page.dart';
// import 'package:testproj1/screens/image_level2_page.dart';
// import 'package:testproj1/screens/video_level_page.dart';
// import 'package:testproj1/screens/summary_page.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   final appState = AppState();

//   @override
//   Widget build(BuildContext context) {
//     return ValueBuilder<String>(
//       stream: appState.themeStream.stream,
//       builder: (context, theme) {
//         return AppStateProvider(
//           appState: appState,
//           child: MaterialApp(
//             title: 'Misinformation Game',
//             theme: theme == 'light' ? ThemeData.light() : ThemeData.dark(),
//             initialRoute: '/',
//             routes: {
//               '/': (context) => MainPage(),
//               '/image_level1': (context) => ImageLevel1Page(question: null), // Pass a question here
//               '/image_level2': (context) => ImageLevel2Page(question: null), // Pass a question here
//               '/video_level': (context) => VideoLevelPage(),
//               '/summary': (context) =>  SummaryPage(appState: appState),
//             },
//           ),
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/screens/main_page.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/app_state.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   final appState = AppState();

//   @override
//   Widget build(BuildContext context) {
//     return AppStateProvider(
//       appState: appState,
//       child: MaterialApp(
//         title: 'Misinformation Game',
//         theme: ThemeData.light(),
//         home: MainPage(),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/screens/main_page.dart';
// import 'package:testproj1/models/app_state.dart'; // Import the AppState class

// void main() {
//   runApp(const App()); // Use const with the constructor to improve performance
// }

// class App extends StatelessWidget {
//   final appState = AppState();

//   const App({Key? key}) : super(key: key); // Add named 'key' parameter to the constructor

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Misinformation Game',
//       theme: ThemeData.light(),
//       home: MainPage(),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/screens/main_page.dart';
// import 'package:testproj1/models/app_state.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   final AppState appState = AppState();

//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Misinformation Game',
//       theme: ThemeData.light(),
//       home: MainPage(),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/screens/main_page.dart';
// import 'package:testproj1/models/app_state.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   final AppState appState = AppState(); // Removed the const keyword here

//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Misinformation Game',
//       theme: ThemeData.light(),
//       home: MainPage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:testproj1/screens/main_page.dart';
import 'package:testproj1/models/app_state.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final AppState appState = AppState(); // Removed the const keyword here

  App({Key? key}) : super(key: key); // Removed the const keyword here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Misinformation Game',
      theme: ThemeData.light(),
      home: MainPage(),
    );
  }
}
