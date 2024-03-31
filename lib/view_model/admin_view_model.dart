import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionViewModel extends ChangeNotifier {
  late List<DocumentSnapshot> _questions = [];

  List<DocumentSnapshot> get questions => _questions;

  Future<void> fetchQuestions() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('questions').get();
      _questions = querySnapshot.docs;
    } catch (error) {
      print("Error fetching questions: $error");
    }
    notifyListeners();
  }

  Future<void> addQuestion({
    required String question,
    required List<String> options,
    required String correctAnswer, required int setNumber,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('questions').add({
        'question': question,
        'options': options,
        'correctAnswer': correctAnswer,
      });
      // Fetch the updated list of questions after adding the new question
      await fetchQuestions();
    } catch (error) {
      print("Error adding question: $error");
    }
  }

  Future<void> deleteQuestion(String questions) async {
    try {
      await FirebaseFirestore.instance.collection('questions').doc(questions).delete();
      _questions.removeWhere((question) => question== questions);
      notifyListeners();
    } catch (error) {
      print("Error deleting question: $error");
    }
  }
}
   