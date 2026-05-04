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

Future syncProfileData(String userId) async {
  final supabase = Supabase.instance.client;

  try {
    final response =
        await supabase.from('profiles').select().eq('id', userId).single();

    if (response != null) {
      FFAppState().update(() {
        FFAppState().loggedUser = ProfilesStruct(
          id: response['id'],
          username: response['username'],
          gender: response['gender'],
          age: response['age'],
          height: response['height'],
          weight: response['weight'],
          goalWeight: response['goal_weight'],
          activityLevel: response['activity_level'],
          targetCalories: response['target_calories'],
          targetCarbs: response['target_carbs'],
          targetProtein: response['target_protein'],
          targetFats: response['target_fats'],
          email: response['email'],
          mainGoal: response['maingoal'],
          calculationMode: response['calculation_mode'],
          onboardingComplete: response['onboarding_complete'],
        );
      });
    }
  } catch (e) {
    print('Error al pasar los datos de la base de datos al usuario local: $e');
  }
}
