import '../database.dart';

class RecipeIngredientsTable extends SupabaseTable<RecipeIngredientsRow> {
  @override
  String get tableName => 'recipe_ingredients';

  @override
  RecipeIngredientsRow createRow(Map<String, dynamic> data) =>
      RecipeIngredientsRow(data);
}

class RecipeIngredientsRow extends SupabaseDataRow {
  RecipeIngredientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecipeIngredientsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get recipeId => getField<int>('recipe_id')!;
  set recipeId(int value) => setField<int>('recipe_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get amountGrams => getField<int>('amount_grams');
  set amountGrams(int? value) => setField<int>('amount_grams', value);
}
