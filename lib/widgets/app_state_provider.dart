// // app_state_provider.dart
// import 'package:flutter/material.dart';
// import 'package:testproj1/models/app_state.dart';

// class AppStateProvider extends InheritedWidget {
//   final AppState appState;

//   AppStateProvider({required this.appState, required Widget child})
//       : super(child: child);

//   static AppState of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AppStateProvider>()!.appState;
//   }

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
// }
