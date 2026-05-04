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

Future<void> updateAndLogFood(
  String userId,
  DateTime targetDate,
  String mealType,
  String name,
  double calories,
  double carbs,
  double protein,
  double fats,
  int? amountGrams,
  int productId,
) async {
  try {
    final supabase = Supabase.instance.client;

    // SOLO ACTUALIZAMOS EL PRODUCTO EXISTENTE EN LA BASE DE DATOS
    // Al usar una View en Supabase, el diario leerá estos nuevos datos automáticamente.
    await supabase.from('products').update({
      'name': name,
      'calories_per_100g': calories,
      'carbs_per_100g': carbs,
      'protein_per_100g': protein,
      'fats_per_100g': fats,
    }).eq('id', productId);
  } catch (e) {
    print('Error al actualizar el producto: $e');
  }
}
