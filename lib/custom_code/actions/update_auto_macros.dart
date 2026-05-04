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

Future<void> updateAutoMacros(
  String uid,
  String gender,
  int age,
  int height,
  int weight,
  String activityLevel,
  String mainGoal,
) async {
  try {
    final supabase = Supabase.instance.client;

    // 1. RECALCULAR MATEMÁTICAS
    double bmr;
    if (gender == 'Male') {
      bmr = 66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age);
    } else {
      bmr = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
    }

    double tdee;
    switch (activityLevel) {
      case 'Sedentary':
        tdee = bmr * 1.2;
        break;
      case 'Lightly Active':
        tdee = bmr * 1.375;
        break;
      case 'Active':
        tdee = bmr * 1.55;
        break;
      case 'Very Active':
        tdee = bmr * 1.725;
        break;
      default:
        tdee = bmr * 1.2;
    }

    double targetCalories;
    double proteinFactor = 1.4;
    double fatFactor;

    if (mainGoal == 'Lose Weight') {
      targetCalories = tdee - 300;
      fatFactor = 0.5;
    } else if (mainGoal == 'Build Muscle') {
      targetCalories = tdee + 200;
      fatFactor = 1.0;
    } else {
      targetCalories = tdee;
      fatFactor = 0.8;
    }

    if (gender == 'Male' && targetCalories < 1500)
      targetCalories = 1500;
    else if (gender != 'Male' && targetCalories < 1200) targetCalories = 1200;

    int proteinGrams = (weight * proteinFactor).round();
    int fatsGrams = (weight * fatFactor).round();

    double remainingCalories =
        targetCalories - (proteinGrams * 4.0) - (fatsGrams * 9.0);

    if (remainingCalories < 0) remainingCalories = 0;
    int carbsGrams = (remainingCalories / 4.0).round();

    // 2. ACTUALIZAR SUPABASE AL MODO AUTOMÁTICO
    await supabase.from('profiles').update({
      'target_calories': targetCalories.round(),
      'target_carbs': carbsGrams,
      'target_protein': proteinGrams,
      'target_fats': fatsGrams,
      'calculation_mode': 'Automatic'
    }).eq('id', uid);
  } catch (e) {
    print('Error en actualización automática: $e');
  }
}
