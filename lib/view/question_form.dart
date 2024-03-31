import 'package:flutter/material.dart';
import 'package:adminapp/view/question_list.dart';
import 'package:adminapp/view_model/admin_view_model.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  final int setNumber;

  AdminScreen({required this.setNumber});

  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Admin Panel - Set $setNumber'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Enter Question'),
            ),
            TextField(
              controller: option1Controller,
              decoration: InputDecoration(labelText: 'Enter Option 1'),
            ),
            TextField(
              controller: option2Controller,
              decoration: InputDecoration(labelText: 'Enter Option 2'),
            ),
            TextField(
              controller: option3Controller,
              decoration: InputDecoration(labelText: 'Enter Option 3'),
            ),
            TextField(
              controller: option4Controller,
              decoration: InputDecoration(labelText: 'Enter Option 4'),
            ),
            TextField(
              controller: correctAnswerController,
              decoration: InputDecoration(labelText: 'Enter Correct Answer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final addQuestionViewModel = Provider.of<QuestionViewModel>(context, listen: false);
                // Get the entered question, options, and correct answer from the TextFields
                final String question = questionController.text;
                final List<String> options = [
                  option1Controller.text,
                  option2Controller.text,
                  option3Controller.text,
                  option4Controller.text,
                ];
                final String correctAnswer = correctAnswerController.text;

                // Add the question to the ViewModel
                addQuestionViewModel.addQuestion(
                  setNumber: setNumber, // Pass setNumber to addQuestion
                  question: question,
                  options: options,
                  correctAnswer: correctAnswer,
                );

                // Navigate to the QuestionListScreen while passing the entered data as parameters
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionListScreen(
                      setNumber: setNumber, // Pass setNumber to QuestionListScreen
                      question: question,
                      options: options,
                      correctAnswer: correctAnswer,
                    ),
                  ),
                );
              },
              child: Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}
