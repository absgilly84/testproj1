// // import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/models/category.dart'; // Import the Category model


// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appState = AppStateProvider.of<AppState>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Misinformation Game')),
//       body: StreamBuilder<List<Category>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<Category> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the appropriate level page based on category ID
//                       navigateToLevelPage(context, category.id);
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevelPage(BuildContext context, int categoryId) {
//     switch (categoryId) {
//       case 1:
//         Navigator.pushNamed(context, '/image_level1');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/image_level2');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/video_level');
//         break;
//       default:
//         // Handle other categories if needed
//         break;
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/models/category.dart'; // Import the Category model

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appState = AppStateProvider.of<AppState>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Misinformation Game')),
//       body: StreamBuilder<List<Category>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<Category> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the appropriate level page based on category ID
//                       navigateToLevelPage(context, category.id);
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevelPage(BuildContext context, int categoryId) {
//     switch (categoryId) {
//       case 1:
//         Navigator.pushNamed(context, '/image_level1');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/image_level2');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/video_level');
//         break;
//       default:
//         // Handle other categories if needed
//         break;
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/models/category.dart'; // Import the Category model

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Adjust the type argument of AppStateProvider to AppState
//     final appState = AppStateProvider.of<AppState>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Misinformation Game')),
//       body: StreamBuilder<List<DifficultyLevel>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DifficultyLevel> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the appropriate level page based on category ID
//                       navigateToLevelPage(context, category.id);
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevelPage(BuildContext context, int categoryId) {
//     switch (categoryId) {
//       case 1:
//         Navigator.pushNamed(context, '/image_level1');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/image_level2');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/video_level');
//         break;
//       default:
//         // Handle other categories if needed
//         break;
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/app_state.dart';
// //import 'package:testproj1/models/difficulty_level.dart'; // Import the correct class representing difficulty levels
// import 'package:testproj1/models/category.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Adjust the type argument of AppStateProvider to AppState
//     final appState = AppStateProvider.of<AppState>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Misinformation Game')),
//       body: StreamBuilder<List<DifficultyLevel>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DifficultyLevel> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the appropriate level page based on category ID
//                       navigateToLevelPage(context, category.id);
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevelPage(BuildContext context, int categoryId) {
//     switch (categoryId) {
//       case 1:
//         Navigator.pushNamed(context, '/image_level1');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/image_level2');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/video_level');
//         break;
//       default:
//         // Handle other categories if needed
//         break;
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// //import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/models/category.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Remove the type argument from AppStateProvider.of
//     final appState = AppStateProvider.of(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Misinformation Game')),
//       body: StreamBuilder<List<DifficultyLevel>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DifficultyLevel> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the appropriate level page based on category ID
//                       navigateToLevelPage(context, category.id);
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevelPage(BuildContext context, int categoryId) {
//     switch (categoryId) {
//       case 1:
//         Navigator.pushNamed(context, '/image_level1');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/image_level2');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/video_level');
//         break;
//       default:
//         // Handle other categories if needed
//         break;
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/category.dart'; // Update the import statement

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final appState = AppStateProvider.of(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Misinformation Game')),
//       body: StreamBuilder<List<DifficultyLevel>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DifficultyLevel> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       navigateToLevelPage(context, category.id);
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevelPage(BuildContext context, int categoryId) {
//     switch (categoryId) {
//       case 1:
//         Navigator.pushNamed(context, '/image_level1');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/image_level2');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/video_level');
//         break;
//       default:
//         // Handle other categories if needed
//         break;
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';
// import 'package:testproj1/models/category.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final appState = AppStateProvider.of(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Misinformation Game')),
//       body: StreamBuilder<List<DifficultyLevel>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DifficultyLevel> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to level page or handle logic here
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/widgets/app_state_provider.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final appState = AppStateProvider.of(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Misinformation Game')),
//       body: StreamBuilder<List<DifficultyLevel>>(
//         stream: appState.categoriesStream.stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DifficultyLevel> categories = snapshot.data!;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (final category in categories)
//                   ElevatedButton(
//                     onPressed: () {
//                       navigateToLevel1Page(context); // Navigate to Level 1 page
//                     },
//                     child: Text(category.name),
//                   ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   void navigateToLevel1Page(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ImageLevel1Page()), // Navigate to Level 1 page
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:testproj1/models/category.dart';
import 'package:testproj1/screens/image_level1_page.dart'; // Import the page you want to navigate to
import 'package:testproj1/models/app_state.dart'; // Import the AppState class

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState(); // Create an instance of AppState

    return Scaffold(
      appBar: AppBar(title: const Text('Misinformation Game')),
      body: StreamBuilder<List<DifficultyLevel>>(
        stream: appState.categoriesStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DifficultyLevel> categories = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final category in categories)
                  ElevatedButton(
                    onPressed: () {
                      navigateToLevel1Page(context); // Navigate to Level 1 page
                    },
                    child: Text(category.name),
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void navigateToLevel1Page(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImageLevel1Page()), // Navigate to Level 1 page
    );
  }
}
