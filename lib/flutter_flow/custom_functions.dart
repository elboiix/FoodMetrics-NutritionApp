import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? sumMacrosForMeal(
  List<VwDiaryDisplayRow>? mealItems,
  String macroType,
) {
  if (mealItems == null || mealItems.isEmpty) {
    return 0;
  }

  double total = 0.0;

  for (var item in mealItems) {
    if (macroType == 'calories') {
      total += item.caloriesPer100g ?? 0;
    } else if (macroType == 'carbs') {
      total += item.carbsPer100g ?? 0;
    } else if (macroType == 'protein') {
      total += item.proteinPer100g ?? 0;
    } else if (macroType == 'fats') {
      total += item.fatsPer100g ?? 0;
    }
  }

  return total.round();
}

double? convertKjToKcal(int? kj) {
  if (kj == null || kj <= 0) {
    return 0.0;
  }

  return (kj / 4.184).roundToDouble();
}

DateTime? normalizeDate(DateTime? inputDate) {
  if (inputDate == null) {
    return null;
  }

  return DateTime(inputDate.year, inputDate.month, inputDate.day);
}
