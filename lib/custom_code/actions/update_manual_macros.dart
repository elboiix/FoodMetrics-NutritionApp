// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateManualMacros(
  String uid,
  int calories,
  int carbs,
  int proteins,
  int fats,
) async {
  try {
    final supabase = Supabase.instance.client;

    await supabase.from('profiles').update({
      'target_calories': calories,
      'target_carbs': carbs,
      'target_protein': proteins,
      'target_fats': fats,
      'calculation_mode': 'Manual'
    }).eq('id', uid);
  } catch (e) {
    print('Error en actualización manual: $e');
  }
}
