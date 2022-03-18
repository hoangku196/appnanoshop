import 'dart:io';

import 'package:flutter/material.dart';

class CommentProvider extends ChangeNotifier {
  double _rating = 3;
  String _comment = '';
  String _email = '';
  String _name = '';
  List<File> _imageFiles = [];

  double get rating => _rating;

  String get email => _email;

  String get name => _name;

  String get comment => _comment;

  List<File> get imageFiles => _imageFiles;

  setRating(double newValue) {
    _rating = newValue;
    notifyListeners();
  }

  setComment(String newValue) {
    _comment = newValue;
    notifyListeners();
  }

  setEmail(String newValue) {
    _email = newValue;
    notifyListeners();
  }

  setName(String newValue) {
    _name = newValue;
    notifyListeners();
  }

  addImage(File newValue) {
    _imageFiles.add(newValue);
    notifyListeners();
  }

  removeImage(File removeValue) {
    _imageFiles.removeWhere((element) => element.path == removeValue.path);
    notifyListeners();
  }
}
