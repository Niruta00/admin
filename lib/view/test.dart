// // set_list_screen.dart
// import 'package:flutter/material.dart';

// class SetListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Set'),
//       ),
//       body: ListView.builder(
//         itemCount: 3, // Number of sets
//         itemBuilder: (context, index) {
//           final setNumber = index + 1;
//           return ListTile(
//             title: Text('Set $setNumber'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => QuestionFormScreen(setNumber: setNumber)),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// // question_form_screen.dart

// class QuestionFormScreen extends StatelessWidget {
//   final int setNumber;

//   QuestionFormScreen({required this.setNumber});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Question Form - Set $setNumber'),
//       ),
//       body: Center(
//         child: Text('Question Form for Set $setNumber'),
//       ),
//     );
//   }
// }

// // question_list_screen.dart

// class QuestionListScreen extends StatelessWidget {
//   final int setNumber;

//   QuestionListScreen({required this.setNumber});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Question List - Set $setNumber'),
//       ),
//       body: Center(
//         child: Text('Question List for Set $setNumber'),
//       ),
//     );
//   }
// }

// // main.dart


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Admin App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SetListScreen(),
//     );
//   }
// }
