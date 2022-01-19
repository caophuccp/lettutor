import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/api/tutor_apis.dart';
import 'package:lettutor/models/tutors/tutor.dart';

class TutorsScreenVM extends ChangeNotifier {
  String? errorMessage;
  List<Tutor>? tutors;

  final _batchSize = 9;
  int _page = 1;
  bool hasMore = false;
  String searchQuery = '';
  List<String>? specialities;
  bool isSearching = false;
  http.Client? client;

  void removeError() {
    errorMessage = null;
    notifyListeners();
  }

  void fetchData() async {
    client?.close();
    client = http.Client();

    try {
      final response = await TutorAPIs.getTutors(
        limit: _batchSize,
        page: _page,
        client: client,
      );
      if (response.result != null) {
        tutors = response.result?.tutors?.rows;
        hasMore = (response.result?.tutors?.rows.length ?? 0) == _batchSize;
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

  Future<void> loadMore() async {
    _page += 1;
    client?.close();
    client = http.Client();

    try {
      final response = await TutorAPIs.getTutors(
        limit: _batchSize,
        page: _page,
        client: client,
      );
      if (response.result != null) {
        final rows = response.result?.tutors?.rows;
        if (rows != null) {
          tutors?.addAll(rows);
          uniqueTutors();
        }
        hasMore = (response.result?.tutors?.rows.length ?? 0) == _batchSize;
      } else {
        errorMessage = response.message;
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }

    notifyListeners();
  }

  Future<void> refresh() async {
    _page = 1;

    if (searchQuery.isNotEmpty) {
      return callSearchAPI();
    }

    client?.close();
    client = http.Client();

    try {
      final response = await TutorAPIs.getTutors(
        limit: _batchSize,
        page: _page,
        client: client,
      );
      if (response.result != null) {
        tutors = response.result?.tutors?.rows;
        hasMore = (response.result?.tutors?.rows.length ?? 0) == _batchSize;
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

  void uniqueTutors() {
    final Set<String> ids = {};
    tutors?.retainWhere((e) => ids.add(e.userId));
  }

  Future<void> search(String query) async {
    searchQuery = query;
    isSearching = true;
    notifyListeners();

    if (searchQuery.isEmpty) {
      await refresh();
      isSearching = false;
      notifyListeners();
      return;
    }

    return callSearchAPI();
  }

  Future<void> callSearchAPI() async {
    client?.close();
    client = http.Client();

    try {
      final response = await TutorAPIs.search(
        searchQuery: searchQuery,
        specialties: specialities,
        client: client,
      );
      hasMore = false;
      if (response.result != null) {
        tutors = response.result?.rows ?? [];
      } else {
        errorMessage = response.message;
        print(errorMessage);
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }
    isSearching = false;
    notifyListeners();
  }

  void filter(final List<String> specialities) {
    this.specialities = specialities
        .map(
          (e) => e.toLowerCase().replaceAll(' ', '-'),
        )
        .toList();
    isSearching = true;
    notifyListeners();
    callSearchAPI();
  }
}
