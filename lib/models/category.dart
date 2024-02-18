// // category.dart

// class DifficultyLevel {
//   DifficultyLevel({required this.id, required this.name});

//   factory DifficultyLevel.fromJson(Map<String, dynamic> json) {
//     return DifficultyLevel(id: json['id'], name: json['name']);
//   }

//   int id;
//   String name;

//   // Add additional fields or methods as needed for your project
//   // For example, you might want to add a method to get a list of difficulty levels

//   static List<DifficultyLevel> getDifficultyLevels() {
//     return [
//       DifficultyLevel(id: 1, name: 'Easy'),
//       DifficultyLevel(id: 2, name: 'Medium'),
//       DifficultyLevel(id: 3, name: 'Hard'),
//     ];
//   }
// }
// class DifficultyLevel {
//   DifficultyLevel({required this.id, required this.name});

//   factory DifficultyLevel.fromJson(Map<String, dynamic> json) {
//     return DifficultyLevel(
//       id: json['id'],
//       name: json['name'],
//     );
//   }

//   int id;
//   String name;

//   // Add any additional fields or methods as needed

//   // You can remove the static list of difficulty levels since we'll fetch them from the API
// }
class DifficultyLevel {
  DifficultyLevel({required this.id, required this.name});

  factory DifficultyLevel.fromJson(Map<String, dynamic> json) {
    return DifficultyLevel(
      id: json['id'],
      name: json['name'],
    );
  }

  int id;
  String name;
}
