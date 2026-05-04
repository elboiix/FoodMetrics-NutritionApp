import '../database.dart';

class VwDiaryDisplayTable extends SupabaseTable<VwDiaryDisplayRow> {
  @override
  String get tableName => 'vw_diary_display';

  @override
  VwDiaryDisplayRow createRow(Map<String, dynamic> data) =>
      VwDiaryDisplayRow(data);
}

class VwDiaryDisplayRow extends SupabaseDataRow {
  VwDiaryDisplayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwDiaryDisplayTable();

  int? get entryId => getField<int>('entry_id');
  set entryId(int? value) => setField<int>('entry_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get logDate => getField<DateTime>('log_date');
  set logDate(DateTime? value) => setField<DateTime>('log_date', value);

  String? get mealType => getField<String>('meal_type');
  set mealType(String? value) => setField<String>('meal_type', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get amountGrams => getField<String>('amount_grams');
  set amountGrams(String? value) => setField<String>('amount_grams', value);

  double? get caloriesPer100g => getField<double>('calories_per_100g');
  set caloriesPer100g(double? value) =>
      setField<double>('calories_per_100g', value);

  double? get carbsPer100g => getField<double>('carbs_per_100g');
  set carbsPer100g(double? value) => setField<double>('carbs_per_100g', value);

  double? get proteinPer100g => getField<double>('protein_per_100g');
  set proteinPer100g(double? value) =>
      setField<double>('protein_per_100g', value);

  double? get fatsPer100g => getField<double>('fats_per_100g');
  set fatsPer100g(double? value) => setField<double>('fats_per_100g', value);
}
