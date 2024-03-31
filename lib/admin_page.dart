// //admin appp
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



// class AdminScreen extends StatefulWidget {
//   @override
//   _AdminScreenState createState() => _AdminScreenState();
// }

// class _AdminScreenState extends State<AdminScreen> {
//   final TextEditingController questionController = TextEditingController();
//   final TextEditingController option1Controller = TextEditingController();
//   final TextEditingController option2Controller = TextEditingController();
//   final TextEditingController option3Controller = TextEditingController();
//   final TextEditingController option4Controller = TextEditingController();
//   final TextEditingController correctAnswerController = TextEditingController();

//   void _addQuestion() {
//     FirebaseFirestore.instance.collection('questions').add({
//       'question': questionController.text,
//       'options': [
//         option1Controller.text.trim(),
//         option2Controller.text.trim(),
//         option3Controller.text.trim(),
//         option4Controller.text.trim(),
//       ],
//       'correctAnswer': correctAnswerController.text,
//     }).then((_) {
//       // Clear text fields after adding the question
//       questionController.clear();
//       option1Controller.clear();
//       option2Controller.clear();
//       option3Controller.clear();
//       option4Controller.clear();
//       correctAnswerController.clear();
//     }).catchError((error) {
//       print("Error adding question: $error");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text('Admin Panel'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: questionController,
//               decoration: InputDecoration(labelText: 'Enter Question'),
//             ),
//             TextField(
//               controller: option1Controller,
//               decoration: InputDecoration(labelText: 'Enter Option 1'),
//             ),
//             TextField(
//               controller: option2Controller,
//               decoration: InputDecoration(labelText: 'Enter Option 2'),
//             ),
//             TextField(
//               controller: option3Controller,
//               decoration: InputDecoration(labelText: 'Enter Option 3'),
//             ),
//             TextField(
//               controller: option4Controller,
//               decoration: InputDecoration(labelText: 'Enter Option 4'),
//             ),
//             TextField(
//               controller: correctAnswerController,
//               decoration: InputDecoration(labelText: 'Enter Correct Answer'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _addQuestion,
//               child: Text('Add Question'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
