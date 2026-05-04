import '../database.dart';

class MealEntriesTable extends SupabaseTable<MealEntriesRow> {
  @override
  String get tableName => 'meal_entries';

  @override
  MealEntriesRow createRow(Map<String, dynamic> data) => MealEntriesRow(data);
}

class MealEntriesRow extends SupabaseDataRow {
  MealEntriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MealEntriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get dailyLogId => getField<int>('daily_log_id')!;
  set dailyLogId(int value) => setField<int>('daily_log_id', value);

  String? get mealType => getField<String>('meal_type');
  set mealType(String? value) => setField<String>('meal_type', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get recipeId => getField<int>('recipe_id');
  set recipeId(int? value) => setField<int>('recipe_id', value);

  int? get amountGramsOrServings => getField<int>('amount_grams_or_servings');
  set amountGramsOrServings(int? value) =>
      setField<int>('amount_grams_or_servings', value);
}
