import 'package:adminapp/view/question_form.dart';
import 'package:flutter/material.dart';


class QuestionListScreen extends StatelessWidget {
  final int setNumber;
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuestionListScreen({
    required this.setNumber,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question List - Set $setNumber'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Question: $question'),
            subtitle: Column(
              children: [
                Text('Options: ${options.join(', ')}'),
                Text('Correct Answer: $correctAnswer'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit functionality
                    // _navigateToEditScreen(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Handle delete functionality
                    // _deleteQuestion(context);/
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the admin page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminScreen(setNumber:setNumber)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
