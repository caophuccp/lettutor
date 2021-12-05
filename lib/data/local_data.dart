import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lettutor/data/tutors_json.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:path_provider/path_provider.dart';

class LocalData {
  LocalData._();
  static final LocalData _instance = LocalData._();
  static LocalData get instance => _instance;

  List<Tutor> _allTutors = [];
  List<Tutor> get allTutors => _allTutors;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final file = File('$path/data.json');
    return file;
  }

  Future<File> writeString(String string) async {
    final file = await _localFile;
    return file.writeAsString(string);
  }

  Future<String> readDataFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<void> loadTutors() async {
    String data = await readDataFile();
    if (data.isEmpty) {
      data = tutorsJson;
      writeString(data);
    }

    _allTutors = tutorsFromJson(data);
    print(_allTutors.length);
  }
}
