import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  ProfilesStruct _loggedUser = ProfilesStruct();
  ProfilesStruct get loggedUser => _loggedUser;
  set loggedUser(ProfilesStruct value) {
    _loggedUser = value;
  }

  void updateLoggedUserStruct(Function(ProfilesStruct) updateFn) {
    updateFn(_loggedUser);
  }

  DateTime? _globalSelectedDate;
  DateTime? get globalSelectedDate => _globalSelectedDate;
  set globalSelectedDate(DateTime? value) {
    _globalSelectedDate = value;
  }
}
