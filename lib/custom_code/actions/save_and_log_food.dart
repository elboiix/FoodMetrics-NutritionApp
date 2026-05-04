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

Future<void> saveAndLogFood(
  String userId,
  DateTime targetDate,
  String mealType,
  String barcode,
  String name,
  double calories,
  double carbs,
  double protein,
  double fats,
  int? amountGrams,
) async {
  try {
    final supabase = Supabase.instance.client;

    // 1. SIEMPRE GUARDAMOS EL PRODUCTO EN LA BASE DE DATOS GLOBAL
    final nuevoProducto = await supabase
        .from('products')
        .insert({
          'barcode': barcode,
          'name': name,
          'calories_per_100g': calories,
          'carbs_per_100g': carbs,
          'protein_per_100g': protein,
          'fats_per_100g': fats,
          'created_by': userId,
          'grams': 100
        })
        .select('id')
        .single();

    int productId = nuevoProducto['id'] as int;

    // 2. REGISTRARLO EN EL DIARIO (Si se especificaron gramos y tipo de comida)
    if (mealType != "None" && amountGrams != null && amountGrams > 0) {
      final dateString = DateFormat('yyyy-MM-dd').format(targetDate);

      // Obtener el ID del diario de hoy
      final existingLog = await supabase
          .from('daily_logs')
          .select('id')
          .eq('user_id', userId)
          .eq('log_date', dateString)
          .single();

      int dailyLogId = existingLog['id'] as int;

      // Registrar la entrada de comida en el diario
      await supabase.from('meal_entries').insert({
        'daily_log_id': dailyLogId,
        'meal_type': mealType,
        'product_id': productId,
        'amount_grams_or_servings': amountGrams,
      });
    }
  } catch (e) {
    print('Error crítico en saveAndLogFood: $e');
  }
}
