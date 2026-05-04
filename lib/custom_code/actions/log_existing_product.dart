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

Future<void> logExistingProduct(
  String userId,
  DateTime targetDate,
  String mealType,
  int productId,
  int amountGrams,
) async {
  try {
    // Si por algún motivo los gramos son 0 o negativos, no hacemos la consulta
    if (amountGrams <= 0) return;

    final supabase = Supabase.instance.client;
    final dateString = DateFormat('yyyy-MM-dd').format(targetDate);

    // 1. OBTENEMOS EL ID DEL DIARIO DE HOY
    final existingLog = await supabase
        .from('daily_logs')
        .select('id')
        .eq('user_id', userId)
        .eq('log_date', dateString)
        .single();

    int dailyLogId = existingLog['id'] as int;

    // 2. AÑADIMOS EL ALIMENTO DIRECTAMENTE A ESE DIARIO
    await supabase.from('meal_entries').insert({
      'daily_log_id': dailyLogId,
      'meal_type': mealType,
      'product_id': productId,
      'amount_grams_or_servings': amountGrams,
    });
  } catch (e) {
    print('Error al guardar el alimento: $e');
  }
}
