import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/api/tutor_apis.dart';
import 'package:lettutor/models/tutors/tutor_detail.dart';

class TutorProfileScreenVM extends ChangeNotifier {
  String? errorMessage;
  TutorDetail? tutor;
  http.Client? client;

  void removeError() {
    errorMessage = null;
    notifyListeners();
  }

  void fetchData(String tutorId) async {
    try {
      final response = await TutorAPIs.getTutorById(tutorId: tutorId);
      if (response.result != null) {
        tutor = response.result;
      } else {
        errorMessage = response.message;
        print(errorMessage);
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    client?.close();
    super.dispose();
  }

  void toggleFavorite(String tutorId) async {
    client?.close();
    client = http.Client();
    try {
      final response = await TutorAPIs.manageFavoriteTutor(
        tutorId: tutorId,
        client: client,
      );
      if (response.result != null) {
        tutor?.isFavorite = false;
      } else if ('Manage success' == response.message) {
        tutor?.isFavorite = true;
      } else {
        errorMessage = response.message;
        print(errorMessage);
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    } finally {
      client?.close();
      client = null;
    }

    notifyListeners();
  }
}
